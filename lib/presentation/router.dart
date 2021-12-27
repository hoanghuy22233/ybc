import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/model/repo/barrel_repo.dart';
import 'package:ybc/presentation/screen/forgot_pass/bloc/bloc.dart';
import 'package:ybc/presentation/screen/forgot_pass/forgot_password_sc.dart';
import 'package:ybc/presentation/screen/forgot_pass_reset/bloc/bloc.dart';
import 'package:ybc/presentation/screen/forgot_pass_reset/forgot_password_reset_sc.dart';
import 'package:ybc/presentation/screen/login/login_screen.dart';
import 'package:ybc/presentation/screen/login/sc_login.dart';
import 'package:ybc/presentation/screen/register/sc_register.dart';
import 'package:ybc/presentation/screen/register_vefical/register_verify_sc.dart';
import 'package:ybc/presentation/screen/splash/sc_splash.dart';
import 'package:ybc/presentation/screen/thought/BHWalkThroughScreen.dart';
import 'package:ybc/presentation/screen/work_home/cart/sc_cart.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courser_detail/bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courser_detail/sc_courser_detail.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/search_courser/search_courser_screen.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/home_banner/bloc/home_banner_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/livestream/sc_video_media.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/map/bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/map/map.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/read_more/bloc/read_more_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/read_more/sc_read_more.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/category_new/bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_detail/bloc/news_detail_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_detail/sc_news_detail.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_new/bloc/news_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/search_new/search_screen.dart';
import 'package:ybc/presentation/screen/work_home/menu/plan_business/create_sample_plan_business_one/sc_create_sample_plan_business.dart';
import 'package:ybc/presentation/screen/work_home/menu/plan_business/create_sample_plan_business_two/sc_create_sample_plan_business_two.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/bought_product/sc_bought_product.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/change_password/bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/change_password/change_password_sc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/contact_form/sc_contact.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/history_order/bloc/history_order_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/history_order/history_order_sc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_account/sc_information_account.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/list_rate/sc_list_rate.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/sc_profile_detail.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/update_information_bloc/update_information_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/project_participating/sc_project_participating.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/project_participating_detail/sc_detail_project_participating.dart';
import 'package:ybc/presentation/screen/work_home/payment/sc_payment.dart';
import 'package:ybc/presentation/screen/work_home/work_navigation/work_navigation.dart';

import 'screen/work_home/menu/plan_business/template_choose/sc_template_choose.dart';

class BaseRouter {
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String REGISTER = 'register';
  static const String FORGOT_PASS = 'forgot_pass';
  static const String FORGOT_PASS_VERIFY = 'forgot_pass_verify';
  static const String REGISTER_VERIFY = 'register_verify';
  static const String FORGOT_PASS_RESET = 'forgot_pass_reset';
  static const String CHANGE_PASSWORD = 'change_password';
  static const String MENU = 'menu';
  static const String THOUGHT = 'thought';
  static const String FOOD_SERVICE = 'food_service';
  static const String WORK_SERVICE = 'work_service';
  static const String NAVIGATION_CAFE = 'navigation_cafe';
  static const String NAVIGATION_FOOD = 'navigation_fast_food';
  static const String NAVIGATION = '/navigation';
  static const String WORK_NAVIGATION = '/work_navigation';
  static const String TAB_OF_CONTENT = '/Table_Of_Contents';
  static const String CREATE_SAMPLE_PLAN = '/create_sample_plan';
  static const String CREATE_SAMPLE_PLAN_TWO = '/create_sample_plan_two';
  static const String CHOOSE_TEMPLATE = '/choose_Template';
  static const String INFORMATION_ACCOUNT = '/information_account';
  static const String BOUGHT_PRODUCT = '/bought_product';
  static const String HISTORY_ORDER = '/history_order';
  static const String CHANGE_PROFILE = '/change_profile';
  static const String CART = '/cart';
  static const String SEARCH = '/search';
  static const String NEWS_DETAIL = '/new_detail';
  static const String ACCOUNT = '/account';
  static const String SEARCH_COURSER = '/search_courser';
  static const String DETAIL_COURSER = '/detail_courser';
  static const String CATEGORY_DETAIL = '/category_detail';
  static const String MAP_USER = '/map_user';
  static const String LIST_VIDEO = '/list_video';
  static const String PROJECT_PARTICIPATING = '/project_participating';
  static const String PROJECT_PARTICIPATING_DETAIL =
      '/project_participating_detail';
  static const String LIST_RATE = '/list_rate';
  static const String UPDATE_LOCATION = '/Update_location';
  static const String REGISTER_CONTACT = '/register_contact';
  static const String PAYMENT = '/payment';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case THOUGHT:
        return MaterialPageRoute(builder: (_) => BHWalkThroughScreen());
      case LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreenPage());
      case WORK_NAVIGATION:
        return MaterialPageRoute(builder: (_) => WorkNavigationScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }

  static Map<String, WidgetBuilder> routes(BuildContext context) {
    var homeRepository = RepositoryProvider.of<HomeRepository>(context);
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    var notificationRepository =
        RepositoryProvider.of<NotificationRepository>(context);
    var addressRepository = RepositoryProvider.of<AddressRepository>(context);
    var cartRepository = RepositoryProvider.of<CartRepository>(context);
    var paymentRepository = RepositoryProvider.of<PaymentRepository>(context);
    var invoiceRepository = RepositoryProvider.of<InvoiceRepository>(context);
    return {
      SPLASH: (context) => SplashScreen(),
      THOUGHT: (context) => BHWalkThroughScreen(),
      // WORK_NAVIGATION: (context) => WorkNavigationScreen(),
      REGISTER: (context) => RegisterScreen(),
      REGISTER_VERIFY: (context) => RegisterVerifyPage(),
      LOGIN: (context) => LoginScreen(),
      LIST_VIDEO: (context) => VideoLiveStreamScreen(),

      CREATE_SAMPLE_PLAN: (context) => CreateSamplePlanScreen(),
      CREATE_SAMPLE_PLAN_TWO: (context) => CreateSamplePlanScreenTwo(),
      CHOOSE_TEMPLATE: (context) => ChooseTemplateScreen(),
      INFORMATION_ACCOUNT: (context) => InformationAccountScreen(),
      BOUGHT_PRODUCT: (context) => BoughtProductScreen(),
      CART: (context) => CartScreen(),
      PROJECT_PARTICIPATING: (context) => ProjectParticipatingScreen(),
      PROJECT_PARTICIPATING_DETAIL: (context) =>
          ProjectParticipatingDetailScreen(),
      LIST_RATE: (context) => ListRateScreen(),
      REGISTER_CONTACT: (context) => ContactScreen(),
      PAYMENT: (context) => PaymentScreen(),

      WORK_NAVIGATION: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => NewsBloc(homeRepository: homeRepository),
            ),
            BlocProvider(
              create: (context) =>
                  NewsCategoryBloc(homeRepository: homeRepository),
            ),
            BlocProvider(
              create: (context) =>
                  HomeBannerBloc(homeRepository: homeRepository),
            ),
            BlocProvider(
              create: (context) => ProfileBloc(userRepository: userRepository),
            ),
          ], child: WorkNavigationScreen()),
      SEARCH: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => NewsBloc(homeRepository: homeRepository),
            ),
          ], child: SearchScreen()),
      SEARCH_COURSER: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => CoursesBloc(homeRepository: homeRepository),
            ),
          ], child: SearchCourserScreen()),
      NEWS_DETAIL: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) =>
                  NewsDetailBloc(homeRepository: homeRepository),
            ),
          ], child: NewsDetailScreen()),

      DETAIL_COURSER: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) =>
                  CourserDetailBloc(homeRepository: homeRepository),
            ),
          ], child: CourserDetailScreen()),

      FORGOT_PASS: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) =>
                  ForgotPasswordBloc(userRepository: userRepository),
            ),
          ], child: ForgotPasswordScreen()),

      FORGOT_PASS_RESET: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) =>
                  ForgotPasswordResetBloc(userRepository: userRepository),
            ),
          ], child: ForgotPasswordResetScreen()),

      CHANGE_PASSWORD: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) =>
                  ChangePasswordBloc(userRepository: userRepository),
            ),
          ], child: ChangePasswordScreen()),

      HISTORY_ORDER: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) =>
                  HistoryOrderBloc(userRepository: userRepository),
            ),
          ], child: HistoryOrderScreen()),

      CHANGE_PROFILE: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) =>
                  UpdateInformationBloc(userRepository: userRepository),
            ),
          ], child: ProfileDetailScreen()),

      MAP_USER: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) =>
                  UserLocationBloc(userRepository: userRepository),
            ),
          ], child: MapUser()),

      CATEGORY_DETAIL: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) =>
                  CategoryDetailBloc(homeRepository: homeRepository),
            ),
          ], child: ReadMoreScreen()),
    };
  }
}
