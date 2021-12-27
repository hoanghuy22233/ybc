import 'package:ybc/app/auth_bloc/bloc.dart';
import 'package:ybc/utils/dio/barrel_dio.dart';
import 'package:ybc/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HttpHandler {
  static Future<void> resolve({DioStatus status}) async {
    //UNSAFE
    if (status == null) {
      print('status.code == null');
      return;
    }
    switch (status.code) {
      case DioStatus.HTTP_UNAUTHORIZED:
        BlocProvider.of<AuthenticationBloc>(Get.context).add(LoggedOut());
        break;
      case DioStatus.API_SUCCESS_NOTIFY:
        await GetSnackBarUtils.createSuccess(message: status.message);
        break;
      case DioStatus.API_FAILURE_NOTIFY:
        await GetSnackBarUtils.createError(message: status.message);
        break;
      case DioStatus.API_SUCCESS:
        await GetSnackBarUtils.removeSnackBar();
        break;
      case DioStatus.API_FAILURE:
        await GetSnackBarUtils.removeSnackBar();
        break;
      case DioStatus.API_PROGRESS:
//        await GetSnackBarUtils.createProgress(message: status.message);
        break;
      case DioStatus.API_PROGRESS_NOTIFY:
        await GetSnackBarUtils.createProgress(message: status.message);
        break;
    }
  }
}
