import 'dart:io';

import 'package:lottie/lottie.dart';
import 'package:ybc/utils/dio/barrel_dio.dart';
import 'package:dio/dio.dart';

class DioErrorUtil {
  // general methods:------------------------------------------------------------
  static DioStatus handleError(dynamic error) {
    print('--TYPE123--');
    print(error.runtimeType);
    print(error.toString());
    if (error is! DioError) {
      return DioStatus(message: 'Unknown status', code: 0);
    }

    String errorDescription = "";
    int code;
    if (error is DioError) {
      code = error.response?.statusCode ?? 0;
      switch (error.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
              "Received invalid status code: ${error.response.statusCode}";
          if (error.response.statusCode == 401) {
//            var appProvider = Provider.of<AppViewModel>(navigatorKey.currentContext, listen: false);
//            var profileViewModel =
//            Provider.of<ProfileViewModel>(navigatorKey.currentContext, listen: false);
//
//            var pref = getIt<SharedPreferenceHelper>();
//            profileViewModel.setProfileResponse(null);
//            appProvider.setToken('');
//            pref.removeAuthToken();
//            Get.off(MainNavigation());
            print(
                "authProviderauthProviderauthProviderauthProviderauthProviderauthProvider");
          }
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return DioStatus(message: errorDescription, code: code);
  }
}
