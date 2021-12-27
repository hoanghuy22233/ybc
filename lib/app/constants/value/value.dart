import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';
import 'package:ybc/app/constants/barrel_constants.dart';

class AppValue {
  AppValue._();
  static final APP_MONEY_FORMAT =
      new NumberFormat("#,### ${AppString.MONEY_UNIT}");
  static final APP_DATE_FORMAT = DateFormat('dd-MM-yyyy kk:mm');
  static final APP_DATE_FORMAT_ONLY_DATE = DateFormat('dd-MM-yyyy');

  static const FONT_SIZE_VERY_SMALL = 10.0;
  static const FONT_SIZE_SMALL = 12.0;
  static const FONT_SIZE_SMALLs = 14.0;
  static const FONT_SIZE_MEDIUM = 15.0;
  static const FONT_SIZE_LARGE = 20.0;
  static const FONT_SIZE_VERY_LARGE = 25.0;

  static const ACTION_BAR_HEIGHT = 45.0;

  static const INPUT_FORM_HEIGHT = 55.0;

  static const PRODUCT_HORIZONTAL_HEIGHT = 320.0;
  static const PRODUCT_HORIZONTAL_WIDTH = 200.0;
  static const PRODUCT_HORIZONTAL_SALE = 50.0;

  static const REFRESHER_CONTAINER_VIEW_HEIGHT = 80.0;
  static const REFRESHER_CONTAINER_VIEW_WIDTH = 80.0;

  static const CART_PROMOTION_MENU_HEIGHT = 50.0;

  static const VERIFY_RESEND_TIME = Duration(seconds: 60);
  static const FAKE_TIME_RELOAD = Duration(milliseconds: 500);

  static const PROFILE_MENU_HEIGHT = 40.0;

  static const BoxFit IMAGE_FIT_MODE = BoxFit.fill;

//  RATIO
  static const double BANNER_RATIO =
      16 / 9; //not use this, get device width/height in runtime
  static const double CATEGORIES_RATIO = 1 / 1;
  static const double CATEGORIES_RATIO_NAME = 1.25;
  static const double PRODUCT_IMAGE_RATIO = 0.7;
  static const double NEWS_IMAGE_RATIO = 1.6;
  static const CropAspectRatio CROP_AVATAR_RATIO =
      CropAspectRatio(ratioX: 1, ratioY: 1);
  static const CropAspectRatio CROP_BACKGROUND_IMAGE_RATIO =
      CropAspectRatio(ratioX: 16, ratioY: 9);

  static const double PRODUCT_GRID_RATIO =
      PRODUCT_HORIZONTAL_WIDTH / PRODUCT_HORIZONTAL_HEIGHT;

  static const double PRODUCT_FILTER_PRICE_BEGIN = 0;
  static const double PRODUCT_FILTER_PRICE_END = 5000000;
  static const double PRODUCT_FILTER_STEP_PRICE = 100000;

  static const APP_HORIZONTAL_PADDING = 10.0;
}
