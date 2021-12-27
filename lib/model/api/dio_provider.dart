import 'package:dio/dio.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/app/constants/network/app_network.dart';

class DioProvider {
  static final Dio _dio = Dio();
  static Dio instance(String token) {
    _dio
      ..options.baseUrl = Endpoint.BASE_URL
      ..options.connectTimeout = Endpoint.connectionTimeout
      ..options.receiveTimeout = Endpoint.receiveTimeout
      ..options.headers = {
        AppNetWork.content_type: AppNetWork.multipart_form_data,
        AppNetWork.auth_type: AppNetWork.bearer(token)
      }
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ));
    return _dio;
  }

  static void bearer(String token) {
    _dio
      ..options.headers = {
        AppNetWork.content_type: AppNetWork.multipart_form_data,
        AppNetWork.auth_type: AppNetWork.bearer(token)
      };
  }
}

//class DioProvider {
//  static Dio instance() {
//    final dio = Dio();
//    dio
//      ..options.baseUrl = Endpoint.BASE_URL
//      ..options.connectTimeout = Endpoint.connectionTimeout
//      ..options.receiveTimeout = Endpoint.receiveTimeout
////      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
//      ..options.headers = {
//        AppNetWork.content_type: AppNetWork.multipart_form_data
//      }
//      ..interceptors.add(LogInterceptor(
//        request: true,
//        responseBody: true,
//        requestBody: true,
//        requestHeader: true,
//      ))
//      ..interceptors.add(
//        InterceptorsWrapper(
//          onRequest: (RequestOptions options) async {
//            // getting shared pref instance
//
//            var prefs = LocalPref();
//            options.onSendProgress = (a, b) {
//              print('a $a - b $b');
//            };
////             getting token
//            var token = await prefs.getString(AppPreferences.auth_token);
//            print('----token-----');
//            print(token);
//            var data = options.data;
//            if (data is FormData) {
//              print('---data---');
//              print(data.boundary);
//              print(data.fields);
//              print(data.files);
//            }
//
//            if (token != null) {
//              options.headers
//                  .putIfAbsent('Authorization', () => 'Bearer $token');
//            } else {
//              print('Auth token is null');
//            }
//          },
//        ),
//      );
//
//    return dio;
//  }
//}
