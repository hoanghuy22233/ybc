import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/utils/locale/app_localization.dart';
import 'package:ybc/utils/snackbar/barrel_snack_bar.dart';
import 'package:flutter/material.dart';

class SnackBarUtils {
  static SnackBar createProgress(
      {@required BuildContext context, String message}) {
    return SnackBar(
        behavior: SnackBarBehavior.floating,
        content: WidgetSnackBar(
          title: AppLocalizations.of(context).translate('all.progress'),
          message: message,
          icon: WidgetCircleProgress(),
        ),
        backgroundColor: Colors.white,
        duration: Duration(days: 365));
  }

  static SnackBar createSuccess(
      {@required BuildContext context, String message}) {
    return SnackBar(
        behavior: SnackBarBehavior.floating,
        content: WidgetSnackBar(
          title: AppLocalizations.of(context).translate('all.success'),
          message: message,
        ),
        backgroundColor: Colors.white,
        duration: Duration(seconds: 2));
  }

  static SnackBar createFailure(
      {@required BuildContext context, String message}) {
    return SnackBar(
        behavior: SnackBarBehavior.floating,
        content: WidgetSnackBar(
          title: AppLocalizations.of(context).translate('all.failure'),
          message: message,
        ),
        backgroundColor: Colors.white,
        duration: Duration(seconds: 2));
  }

  static SnackBar createError(
      {@required BuildContext context, String message}) {
    return SnackBar(
        behavior: SnackBarBehavior.floating,
        content: WidgetSnackBar(
          title: AppLocalizations.of(context).translate('all.error'),
          message: message,
        ),
        backgroundColor: Colors.white,
        duration: Duration(seconds: 2));
  }
}
