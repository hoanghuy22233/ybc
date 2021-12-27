import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:ybc/model/entity/category_menu.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/sc_course.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/home.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/sc_news.dart';
import 'package:ybc/presentation/screen/work_home/menu/plan_business/sc_plan_business.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/sc_profile.dart';
import 'package:ybc/presentation/screen/work_home/work_navigation/widget_work_bottom_nav.dart';
import 'package:ybc/utils/handler/with_auth.dart';

class TabNavigatorRoutesWork {
//  static const String root = '/';
  static const String home = '/home';
  static const String news = '/news';
  static const String course = '/course';
  static const String contract = '/contract';
  static const String person = '/person';
}

class WorkNavigationScreen extends StatefulWidget {
  @override
  _WorkNavigationScreen createState() => _WorkNavigationScreen();
}

class _WorkNavigationScreen extends State<WorkNavigationScreen> {
  PageController _pageController;
  MenuCategories category;
  HomeData homeDatas;
  int id;

  List<WorkFABBottomNavItem> _navMenus = List();
  int _selectedIndex = 2;

  List<WorkFABBottomNavItem> _getTab() {
    return List.from([
      WorkFABBottomNavItem.asset(
          route: TabNavigatorRoutesWork.news,
          tabItem: TabWorkItem.news,
          navigatorKey: GlobalKey<NavigatorState>(),
          assetUri: 'assets/icons/new.png',
          text: 'Tin tức'),
      WorkFABBottomNavItem.asset(
          route: TabNavigatorRoutesWork.course,
          tabItem: TabWorkItem.course,
          navigatorKey: GlobalKey<NavigatorState>(),
          assetUri: 'assets/icons/online-course.png',
          text: "Khóa học"),
      WorkFABBottomNavItem.asset(
          route: TabNavigatorRoutesWork.home,
          tabItem: TabWorkItem.home,
          navigatorKey: GlobalKey<NavigatorState>(),
          assetUri: 'assets/icons/home.png',
          text: "Trang chủ"),
      WorkFABBottomNavItem.asset(
          route: TabNavigatorRoutesWork.contract,
          tabItem: TabWorkItem.contract,
          navigatorKey: GlobalKey<NavigatorState>(),
          assetUri: 'assets/icons/save-file-icon-17.png',
          text: "Lập KHKD"),
      WorkFABBottomNavItem.asset(
          route: TabNavigatorRoutesWork.person,
          tabItem: TabWorkItem.person,
          navigatorKey: GlobalKey<NavigatorState>(),
          assetUri: 'assets/icons/businessman.png',
          text: "Tài khoản"),
    ]);
  }

  goToPage({int page, int id = 0, MenuCategories category, homeData}) {
    WithAuth.isAuth(ifNotAuth: () {
      if (page == 4) {
        AppNavigator.navigateLogin();
      } else {
        if (page != _selectedIndex) {
          setState(() {
            this._selectedIndex = page;
          });
          _pageController.jumpToPage(_selectedIndex);
        }
      }
    }, ifAuth: () {
      if (page != _selectedIndex) {
        setState(() {
          this._selectedIndex = page;
          this.category = category;
          //  this.homeDatas = homeDatas;
          //  this.id = id;
        });
        _pageController.jumpToPage(_selectedIndex);
      }
    });
  }

  @override
  void initState() {
    _pageController =
        new PageController(initialPage: _selectedIndex, keepPage: true);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _navMenus = _getTab();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.only(top: 0),
          child: FloatingActionButton(
            elevation: 4,
            shape:
                CircleBorder(side: BorderSide(color: Colors.white, width: 3)),
            onPressed: () {
              goToPage(page: 2);
            },
            child: FractionallySizedBox(
                widthFactor: 0.5,
                child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      'assets/icons/home.png',
                      color: _selectedIndex == 2
                          ? AppColor.WORK_COLOR
                          : AppColor.NAV_ITEM_COLOR,
                    ))),
            backgroundColor: Colors.white,
          ),
        ),
        bottomNavigationBar: WorkWidgetFABBottomNav(
          notchedShape: CircularNotchedRectangle(),
          backgroundColor: Colors.white,
          selectedIndex: _selectedIndex,
          onTabSelected: (index) async {
            goToPage(page: index);
          },
          //  centerItemText: "A",
          items: _navMenus,
          selectedColor: AppColor.WORK_COLOR,
          color: AppColor.NAV_ITEM_COLOR,
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (newPage) {
            setState(() {
              this._selectedIndex = newPage;
            });
          },
          children: [
            // homeDatas != null
            //     ? NewsCategoryScreen(
            //         id: homeDatas.id,
            //         category: category,
            //         homeData: homeDatas,
            //       )
            //     : WorkNewsScreen(
            //   type: homeDatas.id,
            //         category: category,
            //         homeData: homeDatas,
            //       ),

            // NewsCategoryScreen(
            //   // id: homeDatas.id,
            //   category: category,
            //   homeData: homeDatas,
            // ),
            homeDatas != null
                ? WorkNewsScreen(
                    type: homeDatas?.id ?? null,
                    category: category,
                    homeData: homeDatas,
                  )
                : WorkNewsScreen(
                    //  type: homeDatas?.id ?? null,
                    category: category,
                    homeData: homeDatas,
                  ),
            WorkCourseScreen(
              category: category,
            ),
            WorkHomePage(
              onCategoryClickhomeData: (homeData, id) {
                goToPage(page: 0, id: id);
                homeDatas = homeData;
                print("menu id click $id");
                // id = id;
              },
              onCategoryClick: (
                MenuCategories category,
                id,
              ) {
                print("menu id click $id");
                if (id == 221) {
                  goToPage(page: 0, id: id, category: category);
                  homeDatas = null;
                  //  id = id;
                }
                if (id == 240) {
                  goToPage(page: 0, id: id, category: category);
                  homeDatas = null;
                  // AppNavigator.navigateNavigationCategoryDetail(
                  //     categoryId: id, title: "Tin Tức - Sự Kiện");
                  //  id = id;
                }
                if (id == 239) {
                  goToPage(page: 2, id: id, category: category);
                  homeDatas = null;
                  id = id;
                }
                if (category.name == "Khóa học") {
                  goToPage(page: 1, id: id, category: category);
                  homeDatas = null;
                  //   id = id;
                }
                if (category.name == "Lập KHKD") {
                  goToPage(page: 3, id: id, category: category);
                  homeDatas = null;
                  id = id;
                }
              },
            ),
            PlanBusinessScreen(
              category: category,
            ),
            ProfileWorkScreen(),
          ],
        ));
  }
}
