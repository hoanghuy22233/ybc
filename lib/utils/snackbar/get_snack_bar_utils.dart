import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetSnackBarUtils {
  static SnackStyle _snackStyle = SnackStyle.FLOATING;
  static SnackPosition _snackPosition = SnackPosition.BOTTOM;
  static bool _isDismissible = false;
  static Duration _progressDuration = Duration(days: 365);
  static Duration _stateDuration = Duration(seconds: 1);
  static Duration _stateDurationDelay = Duration(seconds: 2);
  static Color _backgroundColor = AppColor.WORK_COLOR;
  static Color _successColor = Colors.green;
  static Color _failureColor = Colors.orange;
  static Color _errorColor = Colors.red;
  static Color _warningColor = Colors.yellow;
  static Color _informationColor = Colors.blue;

  static createProgress({String message}) {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
    Get.rawSnackbar(
        title: AppLocalizations.of(Get.context).translate('all.progress'),
        message:
            AppLocalizations.of(Get.context).translate('all.progress_message'),
        icon: Center(child: WidgetCircleProgress()),
        duration: _progressDuration,
        backgroundColor: _backgroundColor,
        snackStyle: _snackStyle,
        snackPosition: _snackPosition,
        isDismissible: _isDismissible);
  }

  static Future<void> createSuccess({String message}) async {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
    Get.rawSnackbar(
        title: AppLocalizations.of(Get.context).translate('all.success'),
        message: message != null && message.isNotEmpty
            ? message
            : AppLocalizations.of(Get.context).translate('all.success'),
        icon: Center(
            child: Icon(
          Icons.check,
          color: _successColor,
        )),
        duration: _stateDuration,
        backgroundColor: _backgroundColor,
        snackStyle: _snackStyle,
        snackPosition: _snackPosition,
        isDismissible: _isDismissible);
    return await Future.delayed(_stateDurationDelay);
  }

  static createFailure({String message}) {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
    Get.rawSnackbar(
        title: AppLocalizations.of(Get.context).translate('all.failure'),
        message: message,
        icon: Center(
            child: Icon(
          Icons.error,
          color: _failureColor,
        )),
        duration: Duration(seconds: 2),
        backgroundColor: _backgroundColor,
        snackStyle: _snackStyle,
        snackPosition: _snackPosition,
        isDismissible: _isDismissible);
  }

  static createError({String message}) {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
    Get.rawSnackbar(
        title: AppLocalizations.of(Get.context).translate('all.error'),
        message: message,
        icon: Center(
            child: Icon(
          Icons.error,
          color: _errorColor,
        )),
        duration: Duration(seconds: 2),
        backgroundColor: _backgroundColor,
        snackStyle: _snackStyle,
        snackPosition: _snackPosition,
        isDismissible: _isDismissible);
  }

  static createWarning({String message}) {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
    Get.rawSnackbar(
        title: AppLocalizations.of(Get.context).translate('all.warning'),
        message: message,
        icon: Center(
            child: Icon(
          Icons.warning,
          color: _warningColor,
        )),
        duration: Duration(seconds: 2),
        backgroundColor: _backgroundColor,
        snackStyle: _snackStyle,
        snackPosition: _snackPosition,
        isDismissible: _isDismissible);
  }

  static createInformation({String message}) {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
    Get.rawSnackbar(
        title: AppLocalizations.of(Get.context).translate('all.information'),
        message: message,
        icon: Center(
            child: Icon(
          Icons.notifications,
          color: _informationColor,
        )),
        duration: Duration(seconds: 2),
        backgroundColor: _backgroundColor,
        snackStyle: _snackStyle,
        snackPosition: _snackPosition,
        isDismissible: _isDismissible);
  }

  static removeSnackBar() {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
  }
}
