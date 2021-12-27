import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ybc/app/auth_bloc/authentication_bloc.dart';
import 'package:ybc/app/auth_bloc/authentication_state.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_bloc.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_event.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_work_add_appbar.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_work_appbar.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courser_detail/bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/tab-bar_view/widget_information_course.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/tab-bar_view/widget_intro_course.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/widget_cart_appbar_menu.dart';
import 'package:ybc/utils/dialog/get_dialog_utils.dart';
import 'package:ybc/utils/locale/app_localization.dart';
import 'package:ybc/utils/snackbar/get_snack_bar_utils.dart';
import 'package:ybc/presentation/common_widgets/widget_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'add_cart_bloc/bloc.dart';

class CourserDetailScreen extends StatefulWidget {
  final int id;
  CourserDetailScreen({this.id});
  @override
  _CourserDetailScreenState createState() => _CourserDetailScreenState();
}

class _CourserDetailScreenState extends State<CourserDetailScreen>
    with SingleTickerProviderStateMixin {
  int _courserId;
  ScrollController _scrollController;
  TabController _tabController;
  AddCartBloc _addCartBloc;

  _onArgument() {
    Future.delayed(Duration.zero, () async {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      setState(() {
        _courserId = arguments['courser_id'];
        print('---news_id: $_courserId---');

        BlocProvider.of<CourserDetailBloc>(context)
            .add(LoadCourserDetail(_courserId));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _onArgument();

    _scrollController = ScrollController();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      print('my index is' + _tabController.index.toString());
    });
    BlocProvider.of<CartBloc>(context).add(LoadCart());
    BlocProvider.of<CourserDetailBloc>(context)
        .add(RefreshCourserDetail(widget.id));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String apiToken;
  void openAddCarts(UserRepository repository) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(AppPreferences.auth_token);
    apiToken = token;
  }

  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    openAddCarts(userRepository);
    return Scaffold(
      body: SafeArea(
        top: true,
        child: BlocListener<AddCartBloc, AddCartState>(
          listener: (context, state) async {
            if (state.isSubmitting) {
              GetSnackBarUtils.createProgress();
            }
            if (state.isSuccess) {
              GetSnackBarUtils.createSuccess(message: state.message);
              FocusScope.of(context).unfocus();
            }
            if (state.isFailure) {
              GetSnackBarUtils.createError(message: state.message);
            }
          },
          child: BlocBuilder<AddCartBloc, AddCartState>(builder: (context, state) {
            return Column(
              children: [
                WidgetWorkAddAppbar(
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  title: 'Chi tiết khóa học',
                  right: [WidgetCartAppBarMenu()],
                  left: [WidgetAppbarMenuBack(),],
                ),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: BlocBuilder<CourserDetailBloc,
                          CourserDetailState>(
                        builder: (context, state) {
                          return _buildContents(state);
                        },
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       top: false,
  //       child: Stack(
  //         children: [
  //           Stack(
  //             children: [
  //               WidgetWorkAppbar(
  //                 backgroundColor: Colors.blue,
  //                 textColor: Colors.white,
  //                 title: 'Chi tiết khóa học',
  //               ),
  //               Column(
  //                 children: [
  //                   // WidgetWorkAppbar(
  //                   //   backgroundColor: Colors.blue,
  //                   //   textColor: Colors.white,
  //                   //   title: 'Chi tiết tin tức',
  //                   // ),
  //                   // _buildAppbar("Chi tiết tin tức"),
  //                   Expanded(
  //                     child: SingleChildScrollView(
  //                       physics: AlwaysScrollableScrollPhysics(),
  //                       controller: _scrollController,
  //                       child:
  //                           BlocBuilder<CourserDetailBloc, CourserDetailState>(
  //                         builder: (context, state) {
  //                           return Column(
  //                             children: [
  //                               _buildContents(state),
  //                               Container(
  //                                 height: 200,
  //                                 child: _buildContent(state),
  //                               )
  //                             ],
  //                           );
  //                         },
  //                       ),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ],
  //           ),
  //           WidgetWorkAddAppbar(
  //             backgroundColor: Colors.blue,
  //             textColor: Colors.white,
  //             title: 'Chi tiết khóa học',
  //             left: [
  //               SizedBox(
  //                 width: 10,
  //               ),
  //               WidgetAppbarMenuBack(),
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildContents(CourserDetailState state) {
    if (state is CourserDetailLoaded) {
      var courser = state.courseDetail;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: courser.image ??
                            'https://picsum.photos/250?image=9',
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                        new Icon(Icons.error),
                      )
                  ),

                  // Image.network(
                  //   '${courser.image}',
                  //   fit: BoxFit.cover,
                  // )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Text(
                              '${courser?.name ?? "Chưa có nội dung"}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/ic_coins.png',
                                  color: Colors.black,
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                courser.finalPrice != null
                                    ? Text(
                                  '${AppValue.APP_MONEY_FORMAT.format(courser.finalPrice)}',
                                  style: AppStyle.PRODUCT_SALE_PRICE.copyWith(fontSize: 16),
                                )
                                    : SizedBox(),
                                WidgetSpacer(
                                  height: 0,
                                  width: 10,
                                ),
                                courser.finalPrice != null
                                    ? Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 2,
                                  ),
                                  child: Text(
                                    '${AppValue.APP_MONEY_FORMAT.format(courser.basePrice)}',
                                    style: AppStyle.PRODUCT_PRICE.copyWith(fontSize: 16),
                                  ),
                                )
                                    : Text(
                                  '${AppValue.APP_MONEY_FORMAT.format(courser.basePrice)}',
                                  style: AppStyle.PRODUCT_SALE_PRICE.copyWith(fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/certificate.png',
                                  color: Colors.black,
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                courser.certificate != null
                                    ? Text('Chứng chỉ:  ${courser.certificate}')
                                    : Text('Chứng chỉ: Đang cập nhật'),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/ic_tag.png',
                                  color: Colors.black,
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    courser.tags != null
                                        ? Text('Thể loại: ${courser.tags}')
                                        : Text('Thể loại: Đang cập nhật'),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/ic_level.png',
                                  color: Colors.black,
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                courser.level != null
                                    ? Text('Trình độ:  ${courser.level}')
                                    : Text('Trình độ: Đang cập nhật'),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/ic_lesson.png',
                                  color: Colors.black,
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                courser.utilities != null
                                    ? Text('Bài học:  ${courser.utilities}')
                                    : Text('Bài học: Đang cập nhật'),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/ic_clock.png',
                                  color: Colors.black,
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                courser.time != null
                                    ? Text('Thời gian: ${courser.time}')
                                    : Text('Thời gian: Đang cập nhật'),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (BlocProvider.of<AuthenticationBloc>(
                                        context)
                                        .state is! Authenticated) {
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
                                              colorButton2: Colors.grey[200],
                                              titleAction2: 'Trở về',

                                              action1: (){
                                                AppNavigator.navigateBack();
                                                AppNavigator.navigateLogin();
                                              },
                                              colorButton1: Colors.blue,
                                              titleAction1: 'Đăng nhập',

                                            );
                                          });
                                    } else {
                                      BlocProvider.of<AddCartBloc>(context).add(
                                          AddCart(
                                              courseId: widget.id,
                                              apiToken: apiToken));
                                      FocusScope.of(context).unfocus();
                                      Future.delayed(Duration(seconds: 2), () {
                                        BlocProvider.of<CartBloc>(context).add(RefreshCart());
                                        AppNavigator.navigateCart();
                                      });
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Mua ngay ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (BlocProvider.of<AuthenticationBloc>(
                                        context)
                                        .state is! Authenticated) {
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
                                              colorButton2: Colors.grey[200],
                                              titleAction2: 'Trở về',

                                              action1: (){
                                                AppNavigator.navigateBack();
                                                AppNavigator.navigateLogin();
                                              },
                                              colorButton1: Colors.blue,
                                              titleAction1: 'Đăng nhập',

                                            );
                                          });
                                    } else {
                                      BlocProvider.of<AddCartBloc>(context).add(
                                          AddCart(
                                              courseId: widget.id,
                                              apiToken: apiToken));
                                      FocusScope.of(context).unfocus();
                                      Future.delayed(Duration(seconds: 1), () {
                                        BlocProvider.of<CartBloc>(context).add(RefreshCart());
                                      });
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/ic_addtocart.png',
                                          color: Colors.black,
                                          width: 15,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Thêm giỏ hàng',
                                          style: TextStyle(color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: TabBar(
                  controller: _tabController,
                  indicatorColor: AppColor.WORK_COLOR,
                  tabs: [
                    Tab(
                        child: Text(
                          'GIỚI THIỆU KHOÁ HỌC',
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        )),
                    Tab(
                        child: Text(
                          'NỘI DUNG KHOÁ HỌC',
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        )),
                  ]),
            ),
          ),
          Container(
            height: 500,
            child: TabBarView(controller: _tabController, children: [
              _buildContent(state
                // id: widget.id,
              ),
              _buildInfomation(state),
            ]),
          )
        ],
      );
    } else if (state is CourserDetailLoading) {
      return SizedBox(
        width: Get.width,
        height: Get.height - AppValue.ACTION_BAR_HEIGHT,
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
    } else if (state is CourserDetailNotLoaded) {
      return WidgetScreenError(
        status: state.status,
        inScroll: true,
      );
    } else {
      return Center(
        child: Text('Unknown state'),
      );
    }
  }

  Widget _buildContent(CourserDetailState state) {
    if (state is CourserDetailLoaded) {
      var courser = state.courseDetail;
      return _buildIntro(state);
    } else if (state is CourserDetailLoading) {
      return SizedBox(
        width: Get.width,
        height: Get.height - AppValue.ACTION_BAR_HEIGHT,
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
    } else if (state is CourserDetailNotLoaded) {
      return WidgetScreenError(
        status: state.status,
        inScroll: true,
      );
    } else {
      return Center(
        child: Text('Unknown state'),
      );
    }
  }

  Widget _buildInfomation(CourserDetailState state) {
    if (state is CourserDetailLoaded) {
      var courser = state.courseDetail;
      return _TabInfomation(state);
    } else if (state is CourserDetailLoading) {
      return SizedBox(
        width: Get.width,
        height: Get.height - AppValue.ACTION_BAR_HEIGHT,
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
    } else if (state is CourserDetailNotLoaded) {
      return WidgetScreenError(
        status: state.status,
        inScroll: true,
      );
    } else {
      return Center(
        child: Text('Unknown state'),
      );
    }
  }

  _buildIntro(CourserDetailLoaded state) => TabIntro(
    courseDetail: state.courseDetail,
  );
  _TabInfomation(CourserDetailLoaded state) => TabInfomation(
    courseDetail: state.courseDetail,
  );

  void _launchURL(String url) async {
    if (url != null && await canLaunch(url)) {
      await launch(url);
    }
  }

  int _getCategoryIndex({Cart cart, List<Cart> carts}) {
    if (cart == null) {
      return 0;
    }
    var index = carts.indexWhere((element) => element.id == cart.id);
    return index >= 0 ? index : 0;
  }
}
