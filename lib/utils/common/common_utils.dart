import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppCommonUtils {
  AppCommonUtils._();

  static double textScaleFactor = MediaQuery.of(Get.context).textScaleFactor;

  static void disposeKeyboard() => FocusScope.of(Get.context).unfocus();

  static double calculateHeightProduct() {
    double space = 26 + ((Get.width - 40) / 2) / AppValue.PRODUCT_IMAGE_RATIO;
    double percent =
        AppStyle.APP_MEDIUM.copyWith(fontWeight: FontWeight.w800).height *
            AppValue.FONT_SIZE_MEDIUM *
            textScaleFactor;
    double name = AppStyle.APP_MEDIUM.height *
        AppValue.FONT_SIZE_MEDIUM *
        2 *
        textScaleFactor;
    double price = AppStyle.PRODUCT_PRICE.height *
        AppValue.FONT_SIZE_VERY_SMALL *
        textScaleFactor;
    double priceSale = AppStyle.PRODUCT_SALE_PRICE.height *
        AppValue.FONT_SIZE_SMALL *
        textScaleFactor;
    return space + priceSale + price + name + percent;
  }

  static String firstUpperCase(String value) {
    if (value == null) return "";
    return value.replaceRange(0, 1, value.substring(0, 1).toUpperCase());
  }

  static String hideUserName(String username) {
    if (username == null)
      return "";
    else if (username.contains("@")) {
      return username.replaceRange(
          username.indexOf("@") - 5, username.indexOf("@"), '*****');
    } else {
      return username.replaceRange(((username.length - 3) / 2).ceil(),
          ((username.length - 3) / 2).ceil() + 3, "***");
    }
  }
}
