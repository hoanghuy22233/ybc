import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_bloc.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/widget_appbar_profile.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/widget_cart_appbar_menu.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/ybc/ybc.dart';

import 'information_personal/sc_user_information.dart';

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

class ProfileWorkScreen extends StatefulWidget {
  final int id;
  ProfileWorkScreen({Key key, this.id}) : super(key: key);

  @override
  _ProfileWorkScreenState createState() => _ProfileWorkScreenState();
}

class _ProfileWorkScreenState extends State<ProfileWorkScreen>
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
    BlocProvider.of<CartBloc>(context).add(LoadCart());
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
                    child: Padding(
                      padding: const EdgeInsets.all(AppValue.APP_HORIZONTAL_PADDING),
                      child: TabBarView(
                        controller: _tabController,
                        children: [_userInfo(), _ybcStartup()],
                      ),
                )),
              ],
            ),
    ),
        ));
  }

  _buildAppbar() => WidgetAppbarProfile(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        title: "Thông tin và cài đặt",
        right: [
          WidgetCartAppBarMenu()
        ],
      );

  Widget _buildTabBarMenu() {
    return new Container(
      margin: EdgeInsets.only(top: 60, left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(500)),
      height: AppValue.ACTION_BAR_HEIGHT,
      child: new TabBar(
        controller: _tabController,
        tabs: [
          Tab(
            text: "Thông tin cá nhân",
          ),
          Tab(
            text: "Thông tin VDONE Startups",
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

  Widget _userInfo() => UserInformation();
  Widget _ybcStartup() => YBCStartupScreen();
}
