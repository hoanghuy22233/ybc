import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/livestream/live/sc_live_stream.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/livestream/video/sc_list_video.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/livestream/widget_appbar_video.dart';

// class MyProfileWork extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: Brightness.light,
//         primaryColor: AppColor.PRIMARY_COLOR,
//         accentColor: AppColor.PRIMARY_COLOR,
//         hoverColor: AppColor.PRIMARY_COLOR,
//         fontFamily: 'Montserrat',
//       ),
//       navigatorObservers: [],
//       home: ProfileWorkScreen(),
//     );
//   }
// }

class VideoLiveStreamScreen extends StatefulWidget {
  final int id;
  VideoLiveStreamScreen({Key key, this.id}) : super(key: key);

  @override
  _VideoLiveStreamScreenState createState() => _VideoLiveStreamScreenState();
}

class _VideoLiveStreamScreenState extends State<VideoLiveStreamScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      print('my index is' + _tabController.index.toString());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          top: true,
          child: Container(
      color: Colors.grey[100],
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.grey[100],

                  // height: MediaQuery.of(context).size.height * 0.1,
                  child: _buildAppbar(),
                ),
                _buildTabBarMenu(),
              ],
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [_ListVideo(), _Live()],
            )),
          ],
      ),
    ),
        ));
  }

  _buildAppbar() => WidgetAppbarLiveStream(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        title: "Media Ybc",
        right: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: GestureDetector(
              onTap: () {
                AppNavigator.navigateCart();
              },
              child: Container(
                height: 40,
                width: 40,
                child: Lottie.asset(
                  'assets/lottie/lf30_editor_1punzcxk.json',
                ),
              ),
            ),
          )
        ],
        left: [WidgetAppbarMenuBack()],
      );

  Widget _buildTabBarMenu() {
    return new Container(
      margin: EdgeInsets.only(top: 80, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(500)),
      height: AppValue.ACTION_BAR_HEIGHT,
      child: new TabBar(
        controller: _tabController,
        tabs: [
          Tab(
            text: "Danh sách video",
          ),
          Tab(
            text: "Livestream",
          ),
        ],
        labelStyle: AppStyle.DEFAULT_SMALL,
        unselectedLabelStyle: AppStyle.DEFAULT_SMALL,
        labelColor: Colors.blue,
        unselectedLabelColor: AppColor.BLACK,
        indicator: new BubbleTabIndicator(
          indicatorHeight: AppValue.ACTION_BAR_HEIGHT - 10,
          indicatorColor: Colors.white,
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
          indicatorRadius: 500,
        ),
      ),
    );
  }

  Widget _ListVideo() => ListVideoScreen();
  Widget _Live() => ListVideoStreamScreen();
}
