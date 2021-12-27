import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:get/get.dart';
import 'package:ybc/app/simple_bloc_delegate.dart';
import 'package:ybc/app_config.dart';
import 'package:ybc/model/api/dio_provider.dart';
import 'package:ybc/model/local/barrel_local.dart';
import 'package:ybc/model/repo/barrel_repo.dart';
import 'package:ybc/presentation/router.dart';
import 'package:ybc/presentation/screen/barrel_screen.dart';
import 'package:ybc/presentation/screen/forgot_pass_reset/resend_bloc/resend_bloc.dart';
import 'package:ybc/presentation/screen/splash/sc_splash.dart';
import 'package:ybc/presentation/screen/thought/bloc/home_thought_bloc.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courser_detail/add_cart_bloc/add_cart_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courser_detail/bloc/courser_detail_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/bloc/courses_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/category_courser/bloc/category_course_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/bloc/home_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/home_category/bloc/home_category_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/map/bloc/user_location_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/map/bloc_detail_user/information_user_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/map/bloc_update_location/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_detail/bloc/news_detail_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/history_order/bloc/history_order_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/bloc/profile_detail_bloc.dart';
import 'package:ybc/presentation/screen/work_home/payment/payment_form/bloc/payment_form_bloc.dart';
import 'package:ybc/utils/utils.dart';
import 'package:ybc/presentation/screen/forgot_pass/bloc/forgot_password_bloc.dart';
import 'auth_bloc/bloc.dart';
import 'constants/barrel_constants.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  static Widget runWidget(String token) {
    BlocSupervisor.delegate = SimpleBlocDelegate();
    Dio dio = DioProvider.instance(token);

    final UserRepository userRepository = UserRepository(dio: dio);
    final SessionRepository sessionRepository =
        SessionRepository(pref: LocalPref());

    final HomeRepository homeRepository = HomeRepository(dio: dio);

    final NotificationRepository notificationRepository =
        NotificationRepository(dio: dio);

    final AddressRepository addressRepository = AddressRepository(dio: dio);

    final CartRepository cartRepository = CartRepository(dio: dio);

    final PaymentRepository paymentRepository = PaymentRepository(dio: dio);

    final InvoiceRepository invoiceRepository = InvoiceRepository(dio: dio);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => userRepository,
        ),
        RepositoryProvider<SessionRepository>(
            create: (context) => sessionRepository),
        RepositoryProvider<HomeRepository>(
          create: (context) => homeRepository,
        ),
        RepositoryProvider<NotificationRepository>(
          create: (context) => notificationRepository,
        ),
        RepositoryProvider<AddressRepository>(
          create: (context) => addressRepository,
        ),
        RepositoryProvider<CartRepository>(
          create: (context) => cartRepository,
        ),
        RepositoryProvider<PaymentRepository>(
          create: (context) => paymentRepository,
        ),
        RepositoryProvider<InvoiceRepository>(
          create: (context) => invoiceRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(
                userRepository: userRepository,
                sessionRepository: sessionRepository)
              ..add(AppInitialized()),
          ),
          BlocProvider(
            create: (context) => HomeBloc(homeRepository: homeRepository),
          ),
          BlocProvider(
            create: (context) => ProfileBloc(userRepository: userRepository),
          ),
          BlocProvider(
            create: (context) =>
                InformationUserBloc(homeRepository: homeRepository),
          ),
          BlocProvider(
            create: (context) =>
                ProfileDetailBloc(userRepository: userRepository),
          ),
          BlocProvider(
            create: (context) => CoursesBloc(homeRepository: homeRepository),
          ),
          BlocProvider(
            create: (context) =>
                CourserDetailBloc(homeRepository: homeRepository),
          ),
          BlocProvider(
            create: (context) => NewsDetailBloc(homeRepository: homeRepository),
          ),
          BlocProvider(
            create: (context) => HomeThoughBloc(homeRepository: homeRepository),
          ),
          BlocProvider(
            create: (context) =>
                UpdateLocationBloc(userRepository: userRepository),
          ),
          BlocProvider(
            create: (context) =>
                HomeCategoryBloc(homeRepository: homeRepository),
          ),
          BlocProvider(
            create: (context) =>
                HomeCategoryBloc(homeRepository: homeRepository),
          ),
          BlocProvider(
            create: (context) =>
                CategoryCourseBloc(homeRepository: homeRepository),
          ),
          BlocProvider(
            create: (context) => AddCartBloc(userRepository: userRepository),
          ),
          BlocProvider(
            create: (context) => CartBloc(userRepository: userRepository),
          ),
          BlocProvider(
            create: (context) => PaymentFormBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider(
            create: (context) => ForgotPasswordBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider(
            create: (context) => ResendOTPBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider(
            create: (context) => HistoryOrderBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider(
            create: (context) => UserLocationBloc(
              userRepository: userRepository,
            ),
          ),
        ],
        child: MyApp(),
      ),
    );
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getKeyHash();
    final config = AppConfig.of(context);
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
    return GetMaterialApp(
      debugShowCheckedModeBanner: config.debugTag,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColor.PRIMARY_COLOR,
        accentColor: AppColor.PRIMARY_COLOR,
        hoverColor: AppColor.PRIMARY_COLOR,
        fontFamily: 'Montserrat',
      ),
      navigatorObservers: [],
      supportedLocales: AppLanguage.getSupportLanguage().map((e) => e.locale),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) {
          debugPrint("*language locale is null!!!");
          return supportedLocales.first;
        }
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      locale: Locale('vi', 'VN'),
      routes: BaseRouter.routes(context),
      home: SplashScreen(),
    );
  }

  static const platform = const MethodChannel('flutter.key_hash');

  getKeyHash() async {
    String response = "";
    try {
      final String result = await platform.invokeMethod('getKeyHash');
      response = result;
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }
    print('---------------------------');
    print("Response: $response");
  }
}
