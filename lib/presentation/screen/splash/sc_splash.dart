import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ybc/app/auth_bloc/authentication_bloc.dart';
import 'package:ybc/app/auth_bloc/authentication_event.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/local/pref.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/presentation/common_widgets/widget_circle_progress.dart';
import 'package:ybc/presentation/common_widgets/widget_logo.dart';
import 'package:ybc/utils/handler/with_auth.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // @override
  void initState() {
    super.initState();
    // openLogin();
    //  SystemChrome.setEnabledSystemUIOverlays([]);
  }

  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    openLogins(userRepository);
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogo(),
            Container(
              height: 100,
              width: 100,
              child: Lottie.asset(
                'assets/lottie/trail_loading.json',
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildLogo() => WidgetLogo(
        height: Get.width * 0.5,
        widthPercent: 0.5,
      );

  _buildProgress() => WidgetCircleProgress();

  void openLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSelectedCountry = prefs.containsKey(AppPreferences.LOGIN);
    Future.delayed(Duration(seconds: 5), () {
      WithAuth.isAuth(ifNotAuth: () {
        if (isSelectedCountry) {
          AppNavigator.navigateLogin();
        } else {
          AppNavigator.navigateThouht();
        }
      }, ifAuth: () {
        AppNavigator.navigateNavigation();
      });
    });
  }

  void openLogins(UserRepository repository) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSelectedCountry = prefs.containsKey(AppPreferences.LOGIN);
    try {
      final profileResponse = await repository.getProfile();
      if (profileResponse.status == Endpoint.SUCCESS) {
        // await repository.deviceToken(
        //     deviceIdentifier: await _firebaseMessaging.getToken());
        final prefs = LocalPref();
        final token = await prefs.getString(AppPreferences.auth_token);
        BlocProvider.of<AuthenticationBloc>(Get.context).add(LoggedIn(token));
      }
      // final prefs = LocalPref();
      // final token = await prefs.getString(AppPreferences.auth_token);
      // BlocProvider.of<AuthenticationBloc>(Get.context).add(LoggedIn(token));
    } on DioError catch (e) {} finally {
      Future.delayed(Duration(seconds: 2), () {
        if (isSelectedCountry) {
          AppNavigator.navigateWorkService();
        } else {
          AppNavigator.navigateThouht();
        }
        //    AppNavigator.navigateWorkService();
      });
    }
  }
}
