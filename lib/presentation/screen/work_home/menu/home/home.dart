import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:ybc/model/entity/category_menu.dart';
import 'package:ybc/model/repo/home_repository.dart';
import 'package:ybc/presentation/common_widgets/widget_screen_error.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_work_appbar_home.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/bloc/home_event.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';
import 'home_banner/bloc/home_banner_bloc.dart';
import 'home_banner/widget_home_banner.dart';
import 'home_category/bloc/home_category_bloc.dart';
import 'home_category/widget_home_category.dart';
import 'home_tailk/bloc/home_categories_bloc.dart';
import 'home_tailk/widget_home_categories.dart';

// class MyHome extends StatelessWidget {
//   final GlobalKey<ScaffoldState> drawer;
//   final Function moveTab;
//
//   final MenuCategories category;
//   final Function(MenuCategories category, int) onCategoryClick;
//
//   MyHome({this.drawer, this.moveTab, this.onCategoryClick, this.category});
//
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
//       home: WorkHomePage(
//         onCategoryClick: onCategoryClick,
//         category: category,
//         moveTab: moveTab,
//         drawer: drawer,
//       ),
//     );
//   }
// }

class WorkHomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> drawer;
  final Function moveTab;
  final int id;

  final MenuCategories category;
  final HomeData homeData;
  final Function(MenuCategories category, int) onCategoryClick;
  final Function(HomeData homeData, int) onCategoryClickhomeData;

  WorkHomePage(
      {this.drawer,
      this.moveTab,
      this.onCategoryClick,
      this.category,
      this.homeData,
      this.onCategoryClickhomeData,
      this.id});

  @override
  _WorkHomePageState createState() => _WorkHomePageState();
}

class _WorkHomePageState extends State<WorkHomePage>
    with AutomaticKeepAliveClientMixin<WorkHomePage> {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    BlocProvider.of<HomeBloc>(context).add(LoadHome());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //   openLoading();
    var homeRepository = RepositoryProvider.of<HomeRepository>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeCategoriesBloc(homeBloc: BlocProvider.of<HomeBloc>(context)),
        ),
        BlocProvider(
          create: (context) => HomeBannerBloc(homeRepository: homeRepository),
        ),
        BlocProvider(
          create: (context) => HomeCategoryBloc(homeRepository: homeRepository),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              top: true,
              child: Container(
                  color: AppColor.WHITE, child: _buildContent(state))),
        );
      }),
    );
  }

  _buildContent(HomeState state) {
    if (state is HomeLoaded) {
      return _buildHomeLoaded(state);
    } else if (state is HomeLoading) {
      return Center(
        child: Container(
          height: 100,
          width: 100,
          child: Lottie.asset(
            'assets/lottie/trail_loading.json',
          ),
        ),
      );
    } else if (state is HomeNotLoaded) {
      return RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<HomeBloc>(context).add(RefreshHome());
          await Future.delayed(Duration(seconds: 1));
          return true;
        },
        color: AppColor.PRIMARY_COLOR,
        backgroundColor: AppColor.THIRD_COLOR,
        child: WidgetScreenError(
          status: state.status,
        ),
      );
    } else {
      return Center(
        child: Text('Unknown state'),
      );
    }
  }

  _buildHomeLoaded(HomeLoaded state) {
    return Stack(
      children: [
        NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height / 3,
                floating: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: _buildBanner(),
                ),
              ),
            ];
          },
          body: Column(
            children: [
              _buildMenu(),
              Expanded(child: _buildCategories()),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),

        //   _buildNavigationBar(),

        //  _buildLogoAndCart(),
      ],
    );
  }

  // _buildLogoAndCart() => WidgetAppBarMain(
  //       openDrawer: () {
  //         widget.drawer.currentState.openDrawer();
  //       },
  //       color: Colors.transparent,
  //       heroSearch: true,
  //     );

  // _buildBanner() => WidgetHomeBanner(
  //       action: () {
  //         widget.moveTab(page: 0);
  //       },
  //     );

  _buildBanner() => WidgetHomeCategoriesBanners();

  _buildMenu() => WidgetHomeCategoriesMenu(
        onCategoryClick: (MenuCategories category, id) {
          this.widget.onCategoryClick(category, id);
        },
      );

  // _buildNews() => WidgetHomeNews(
  //       actionMore: () {
  //         widget.moveTab(page: 1);
  //       },
  //     );

  _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildCategories() {
    return WidgetHomeCategories(
      onCategoryClick: (HomeData homeData, id) {
        this.widget.onCategoryClickhomeData(homeData, id);
      },
    );
  }

  _buildAction(String text, action) {
    return InkWell(
      onTap: action,
      child: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: Text(
          text.toUpperCase(),
          textAlign: TextAlign.center,
          style: AppStyle.DEFAULT_MEDIUM
              .copyWith(color: AppColor.PRIMARY, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _buildConnect(String uri, action) {
    return InkWell(
      onTap: action,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: 36,
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/icons/$uri.png'), fit: BoxFit.fill)),
      ),
    );
  }

  _buildNavigationBar() {
    return WidgetWorkHomeAppbar(
      title: 'chào bạn',
      backgroundColor: Colors.blue,
      textColor: Colors.white,
    );
  }

  @override
  bool get wantKeepAlive => true;

  void openLoading() async {
    Future.delayed(Duration(seconds: 2), () {
      BlocProvider.of<HomeBloc>(context).add(RefreshHome());
    });
  }
}
