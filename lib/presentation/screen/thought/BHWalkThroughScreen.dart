import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/screen/thought/bloc/bloc.dart';
import 'package:ybc/utils/more/BHColors.dart';
import 'package:ybc/utils/more/BHConstants.dart';

class BHWalkThroughScreen extends StatefulWidget {
  static String tag = '/WalkThroughScreen';

  @override
  BHWalkThroughScreenState createState() => BHWalkThroughScreenState();
}

class BHWalkThroughScreenState extends State<BHWalkThroughScreen> {
  PageController _pageController = PageController();
  int currentPage = 0;
  static const _kDuration = const Duration(seconds: 1);
  static const _kCurve = Curves.ease;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeThoughBloc>(context).add(LoadHomeThough());
  }

  onRefresh(HomeThoughLoaded state) async {
    BlocProvider.of<HomeThoughBloc>(context).add(RefreshHomeThough());
  }

  _onLoadMore(HomeThoughLoaded state) async {
    BlocProvider.of<HomeThoughBloc>(context).add(LoadHomeThough());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeThoughBloc, HomeThoughState>(
      listener: (context, state) {
        if (state is HomeThoughLoaded) {
          if (state.hasReachedMax) {
            _refreshController.loadNoData();
          } else {
            _refreshController.loadComplete();
          }
        }
      },
      child: BlocBuilder<HomeThoughBloc, HomeThoughState>(
        builder: (context, state) {
          return Container(
            child: Scaffold(
              body: _buildContent(state),
            )
          );
        },
      ),
    );
  }

  _saveCountry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppPreferences.LOGIN, "Login");
  }

  Widget _buildContent(HomeThoughState state) {
    if (state is HomeThoughLoaded) {
      return Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (i) {
              currentPage = i;
              setState(() {});
            },
            children: [
              Column(
                children: <Widget>[
                  Image.network('https://clbdoanhnhantrekhoinghiep.com/public/filemanager/userfiles/22.jpg',
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    BHWalkThroughTitle1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: BHAppTextColorPrimary),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(BHWalkThroughSubTitle1,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: BHAppTextColorSecondary)),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Image.network('https://clbdoanhnhantrekhoinghiep.com/public/filemanager/userfiles/111.jpg',
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    BHWalkThroughTitle2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: BHAppTextColorPrimary),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(BHWalkThroughSubTitle2,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: BHAppTextColorSecondary)),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Image.network('https://clbdoanhnhantrekhoinghiep.com/public/filemanager/userfiles/3333.jpg',
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    BHWalkThroughTitle3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: BHAppTextColorPrimary),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(BHWalkThroughSubTitle3,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: BHAppTextColorSecondary)),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 90,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: DotsIndicator(
                dotsCount: 3,
                position: currentPage,
                decorator: DotsDecorator(
                  color: BHGreyColor.withOpacity(0.5),
                  activeColor: BHColorPrimary,
                  size: Size.square(9.0),
                  activeSize: Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  child: Text('Bỏ qua',
                      style: TextStyle(color: BHAppTextColorSecondary)),
                  onPressed: () {
                    // finish(context);
                    // BHLoginScreen().launch(context);
                    AppNavigator.navigateWorkService();
                    _saveCountry();
                  },
                ),
                FlatButton(
                  child: Text(BHBtnNext,
                      style: TextStyle(color: BHAppTextColorSecondary)),
                  onPressed: () {
                    _pageController.nextPage(
                        duration: _kDuration, curve: _kCurve);
                  },
                )
              ],
            ).visible(
              currentPage != 2,
              defaultWidget: Container(
                margin: EdgeInsets.only(),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 270,
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {
                        AppNavigator.navigateWorkService();
                        _saveCountry();
                      },
                      color: BHColorPrimary,
                      child: Text(BHBtnGetStarted,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: whiteColor)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else if (state is HomeThoughLoading) {
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
