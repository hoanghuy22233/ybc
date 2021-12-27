import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';

class AppStyle {
  AppStyle._();

  //DEFAULT STYLE
  static const DEFAULT_VERY_SMALL = TextStyle(
      fontSize: AppValue.FONT_SIZE_VERY_SMALL,
      color: AppColor.BLACK,
      height: 1.2);

  static const DEFAULT_SMALL = TextStyle(
      fontSize: AppValue.FONT_SIZE_SMALL, color: AppColor.BLACK, height: 1.2);

  static const DEFAULT_MEDIUM = TextStyle(
      fontSize: AppValue.FONT_SIZE_MEDIUM, color: AppColor.BLACK, height: 1.2);

  static const DEFAULT_LARGE = TextStyle(
      fontSize: AppValue.FONT_SIZE_LARGE, color: AppColor.BLACK, height: 1.2);

  static const DEFAULT_VERY_LARGE = TextStyle(
      fontSize: AppValue.FONT_SIZE_VERY_LARGE,
      color: AppColor.BLACK,
      height: 1.2);

  static const APP_MEDIUM = TextStyle(
      fontSize: AppValue.FONT_SIZE_MEDIUM,
      color: AppColor.PRIMARY_COLOR,
      height: 1.2);

  //DEFAULT STYLE MIX
  static final DEFAULT_SMALL_BOLD =
      DEFAULT_SMALL.copyWith(fontWeight: FontWeight.bold);
  static final DEFAULT_MEDIUM_BOLD =
      DEFAULT_MEDIUM.copyWith(fontWeight: FontWeight.bold);
  static final DEFAULT_LARGE_BOLD =
      DEFAULT_LARGE.copyWith(fontWeight: FontWeight.bold);
  static final DEFAULT_VERY_LARGE_BOLD =
      DEFAULT_VERY_LARGE.copyWith(fontWeight: FontWeight.bold);
  static final RED_HINT_SMALL = DEFAULT_SMALL.copyWith(color: Colors.red);

  static final PRODUCT_PRICE = DEFAULT_VERY_SMALL.copyWith(
      height: 1.2,
      color: AppColor.GREY,
      decoration: TextDecoration.lineThrough);
  static final PRODUCT_SALE_PRICE = DEFAULT_SMALL.copyWith(
    height: 1.2,
    color: Color(0xFF960909),
  );
  static final PRODUCT_PRICE_DETAIL = DEFAULT_MEDIUM.copyWith(
      color: AppColor.GREY, decoration: TextDecoration.lineThrough);
  static final PRODUCT_SALE_PRICE_DETAIL = DEFAULT_MEDIUM.copyWith(
    color: Color(0xFF960909),
  );

  //APP STYLE MIX
  static final APP_MEDIUM_BOLD =
      APP_MEDIUM.copyWith(fontWeight: FontWeight.bold);
}
