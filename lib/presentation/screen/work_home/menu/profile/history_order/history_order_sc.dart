import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/bought_product/course_bought/sc_course_bought.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/bought_product/template_bussiness_bought/sc_template_plan_business_bought.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/bought_product/template_bussiness_created/sc_template_plan_business_created.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/history_order/all_order/sc_all_order.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/history_order/cancel_order/sc_cancel_order.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/history_order/completed_order/sc_completed_order.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/history_order/waiting_order/sc_waiting_order.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/widget_appbar_profile.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/widget_cart_appbar_menu.dart';
import 'package:ybc/utils/locale/app_localization.dart';

class HistoryOrderScreen extends StatefulWidget {
  final int id;
  HistoryOrderScreen({Key key, this.id}) : super(key: key);

  @override
  _HistoryOrderScreenState createState() => _HistoryOrderScreenState();
}

class _HistoryOrderScreenState extends State<HistoryOrderScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
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
                    //_buildTabBar()
                  ],
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(AppValue.APP_HORIZONTAL_PADDING),
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          AllOrderScreen(),
                          WaitingOrderScreen(),
                          CompletedOrderScreen(),
                          CancelOrderScreen(),
                        ],
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
    title: AppLocalizations.of(context).translate('history_order.title'),
    right: [
      WidgetCartAppBarMenu(),
    ],
    left: [
      Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: WidgetAppbarMenuBack(),
      )
    ],
  );

  Widget _buildTabBarMenu() {
    return new Container(
      margin: EdgeInsets.only(top: 60, left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(50)),
      height: AppValue.ACTION_BAR_HEIGHT,
      child: new TabBar(
        controller: _tabController,
        labelPadding: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        tabs: [
          Container(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width / 4.3),
            alignment: Alignment.center,
            width: 60,
            child: Text(
              'T???t c???',
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width / 4.3),
            alignment: Alignment.center,
            width: 60,
            child: Text(
              '?????i duy???t',
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width / 4.3),
            alignment: Alignment.center,
            width: 60,
            child: Text(
              'Ho??n th??nh',
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width / 4.3),
            alignment: Alignment.center,
            width: 60,
            child: Text(
              'B??? h???y',
              textAlign: TextAlign.center,
            ),
          ),
        ],
        labelStyle: AppStyle.DEFAULT_SMALL_BOLD,
        unselectedLabelStyle: AppStyle.DEFAULT_SMALL,
        labelColor: Colors.blue,
        unselectedLabelColor: AppColor.BLACK,
        physics: BouncingScrollPhysics(),
        indicatorWeight: 3,
        isScrollable: true,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
        indicatorColor: AppColor.GREY,
        indicator: new BubbleTabIndicator(
          indicatorHeight: AppValue.ACTION_BAR_HEIGHT - 10,
          indicatorColor: Colors.white,
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
          indicatorRadius: 50,
        ),
      ),
    );
  }
}
