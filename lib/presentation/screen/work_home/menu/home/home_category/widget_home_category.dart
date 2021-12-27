import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/model/entity/category_menu.dart';
import 'package:ybc/presentation/common_widgets/widget_dialog.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/home_category/bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/work_category.dart';
import 'package:ybc/utils/handler/with_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WidgetHomeCategoriesMenu extends StatefulWidget {
  final List<MenuCategories> category;
  //final RefreshController refreshController;
  final Function(MenuCategories category, int) onCategoryClick;

  WidgetHomeCategoriesMenu({
    Key key,
    this.category,
    this.onCategoryClick,
    //   this.refreshController,
  }) : super(key: key);
  @override
  _WidgetHomeCategoriesMenusState createState() =>
      _WidgetHomeCategoriesMenusState();
}

class _WidgetHomeCategoriesMenusState extends State<WidgetHomeCategoriesMenu> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCategoryBloc>(context).add(LoadHomeCategory());
  }

  onRefresh(HomeCategoryLoaded state) async {
    BlocProvider.of<HomeCategoryBloc>(context).add(RefreshHomeCategory());
  }

  _onLoadMore(HomeCategoryLoaded state) async {
    BlocProvider.of<HomeCategoryBloc>(context).add(LoadHomeCategory());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCategoryBloc, HomeCategoryState>(
      listener: (context, state) {
        if (state is HomeCategoryLoaded) {
          if (state.hasReachedMax) {
            _refreshController.loadNoData();
          } else {
            _refreshController.loadComplete();
          }
        }
      },
      child: BlocBuilder<HomeCategoryBloc, HomeCategoryState>(
        builder: (context, state) {
          return Container(
            child: _buildContent(state),
          );
        },
      ),
    );
  }

  Widget _buildContent(HomeCategoryState state) {
    if (state is HomeCategoryLoaded) {
      return WidgetHomeCategoriesItemMenu(
        category: state.menu,
        onCategoryClick: this.widget.onCategoryClick,
      );
    } else if (state is HomeCategoryLoading) {
      return Container(
        width: double.infinity,
        height: AppValue.PRODUCT_HORIZONTAL_HEIGHT,
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            child: Lottie.asset(
              'assets/lottie/trail_loading.json',
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: Text('Unknown state'),
      );
    }
  }
}

class WidgetHomeCategoriesItemMenu extends StatefulWidget {
  final List<MenuCategories> category;
  //final RefreshController refreshController;
  final Function(MenuCategories category, int) onCategoryClick;

  WidgetHomeCategoriesItemMenu({
    Key key,
    this.category,
    this.onCategoryClick,
    //   this.refreshController,
  }) : super(key: key);
  @override
  _WidgetHomeCategoriesItemMenuState createState() =>
      _WidgetHomeCategoriesItemMenuState();
}

class _WidgetHomeCategoriesItemMenuState
    extends State<WidgetHomeCategoriesItemMenu> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;

  Future _checkGps() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Không thể lấy vị trí hiện tại của bạn!"),
              content: const Text('Hãy bật GPS và thử lại'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    final AndroidIntent intent = AndroidIntent(
                        action: 'android.settings.LOCATION_SOURCE_SETTINGS');
                    intent.launch();
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  _getCurrentLocation() {
    _checkGps();
    //WidgetCircleProgress();
    geolocator.getCurrentPosition().then((Position position) {
      setState(() {
        _currentPosition = position;
        print(
            "aabbcc ${_currentPosition.latitude}, ${_currentPosition.longitude}");
      });
    }).catchError((e) {
      print(e);
    });
  }

  bool isLogin = false;
  void openLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSelectedCountry = prefs.containsKey(AppPreferences.LOGIN);
    isLogin = isSelectedCountry;
  }

  @override
  void initState() {

    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      color: Colors.grey[300],
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1.8),
        padding: EdgeInsets.only(top: 10),
        itemBuilder: (context, index) {
          if (index <= widget.category.length - 1) {
            return WorkCategory(
              menuCategories: widget.category[index],
              onCategoryClick: this.widget.onCategoryClick,
            );
          } else {
            return GestureDetector(
              onTap: () {
                WithAuth.isAuth(ifNotAuth: () {
                  if (isLogin) {
                    AppNavigator.navigateLogin();
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return WidgetDialog(
                            title: 'Lỗi',
                            content: "Vui lòng đăng nhập để sử dụng tính năng này.",
                            image: 'assets/icons/warning.png',

                            action2: (){
                              AppNavigator.navigateBack();
                            },
                            colorButton2: Colors.blue,
                            titleAction2: 'Trở về',

                            action1: (){
                              AppNavigator.navigateBack();
                              AppNavigator.navigateLogin();
                            },
                            colorButton1: Colors.blue,
                            titleAction1: 'Đăng nhập',

                          );
                        });
                  }
                }, ifAuth: () {
                  if(_currentPosition != null){
                    AppNavigator.navigateMapUser(lat: _currentPosition.latitude, long: _currentPosition.longitude);
                  }
                  else {
                    _getCurrentLocation();
                  }
                });
              },
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(500),
                        child: Container(
                          height: 40,
                          width: 40,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset(
                        "assets/images/map.png",
                        height: 30,
                        width: 30,
                        color: AppColor.WORK_COLOR,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Tìm thành viên",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black45, fontSize: 12),
                  ),
                ],
              ),
            );
          }
        },
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.category.length + 1,
        semanticChildCount: 3,
      ),
    );
  }
}
