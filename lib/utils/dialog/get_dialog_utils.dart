import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GetDialogUtils {
  static createNotify(
      {@required String message,
      @required String positiveLabel,
      Function onPositiveTap,
      String negativeLabel,
      Function onNegativeTap}) {
    Get.dialog(
      WidgetSnackBarNotify(
        message: message,
        positiveLabel: positiveLabel,
        onPositiveTap: onPositiveTap,
        negativeLabel: negativeLabel,
        onTouchOutsizeEnable: false,
        onNegativeTap: onNegativeTap ??
            () {
           //   Get.back();
              AppNavigator.navigateNavigation();
            },
      ),
    );
  }
}
