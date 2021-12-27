import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ybc/presentation/router.dart';

class AppNavigator {
  AppNavigator._();

  static navigateBack() async {
    Get.back();
  }

  static navigateBacks() async {
    var result = await Get.offNamed(BaseRouter.WORK_NAVIGATION);
    return result;
  }

  static navigatePopUtil({String name}) async {
    Navigator.popUntil(Get.context, ModalRoute.withName(name));
  }

  static navigateSplash() async {
    var result = await Get.toNamed(BaseRouter.SPLASH);
    return result;
  }

  static navigateLogin() async {
    var result = await Get.toNamed(BaseRouter.LOGIN);
    return result;
  }

  static navigateNavigation() async {
    var result = await Get.offAllNamed(BaseRouter.NAVIGATION);
    return result;
  }

  static navigateMenu() async {
    var result = await Get.offAllNamed(BaseRouter.MENU);
    return result;
  }

  static navigateThouht() async {
    var result = await Get.offAllNamed(BaseRouter.THOUGHT);
    return result;
  }

  static navigateRegister() async {
    var result = await Get.toNamed(BaseRouter.REGISTER);
    return result;
  }

  static navigateForgotPass() async {
    var result = await Get.toNamed(BaseRouter.FORGOT_PASS);
    return result;
  }

  static navigateForgotPassReset({String email}) async {
    var result = await Get.toNamed(BaseRouter.FORGOT_PASS_RESET, arguments: {
      'email': email,
    });
    return result;
  }

  static navigateChangePassword() async {
    var result = await Get.toNamed(BaseRouter.CHANGE_PASSWORD);
    return result;
  }

  static navigateRegisterVerifi() async {
    var result = await Get.toNamed(BaseRouter.REGISTER_VERIFY);
    return result;
  }

  static navigateFoodService() async {
    var result = await Get.toNamed(BaseRouter.FOOD_SERVICE);
    return result;
  }

  static navigateWorkService() async {
    var result = await Get.offAllNamed(BaseRouter.WORK_NAVIGATION);
    return result;
  }

  static navigateNavigationCafe({int id}) async {
    var result = await Get.toNamed(BaseRouter.NAVIGATION_CAFE, arguments: {
      'idStore': id,
    });
    return result;
  }

  static navigateNavigationFastFood() async {
    var result = await Get.toNamed(BaseRouter.NAVIGATION_FOOD);
    return result;
  }

  static navigateTabOfContent() async {
    var result = await Get.toNamed(BaseRouter.TAB_OF_CONTENT);
    return result;
  }

  static navigateCreateSamplePlan() async {
    var result = await Get.toNamed(BaseRouter.CREATE_SAMPLE_PLAN);
    return result;
  }

  static navigateCreateSamplePlanTwo() async {
    var result = await Get.toNamed(BaseRouter.CREATE_SAMPLE_PLAN_TWO);
    return result;
  }

  static navigateChooseTemplate() async {
    var result = await Get.toNamed(BaseRouter.CHOOSE_TEMPLATE);
    return result;
  }

  static navigateInformationAccount() async {
    var result = await Get.toNamed(BaseRouter.INFORMATION_ACCOUNT);
    return result;
  }

  static navigateBoughtProduct() async {
    var result = await Get.toNamed(BaseRouter.BOUGHT_PRODUCT);
    return result;
  }

  static navigateHistoryOrder() async {
    var result = await Get.toNamed(BaseRouter.HISTORY_ORDER);
    return result;
  }

  static navigateChangeProfile() async {
    var result = await Get.toNamed(BaseRouter.CHANGE_PROFILE);
    return result;
  }

  static navigateSearch() async {
    var result = await Get.toNamed(BaseRouter.SEARCH);
    return result;
  }

  static navigateSearchCourses() async {
    var result = await Get.toNamed(BaseRouter.SEARCH_COURSER);
    return result;
  }

  static navigateCart() async {
    var result = await Get.toNamed(BaseRouter.CART);
    return result;
  }

  static navigateNewsDetail(int newsId) async {
    var result = await Get.toNamed(BaseRouter.NEWS_DETAIL,
        arguments: {'news_id': newsId});
    return result;
  }

  static navigateCourserDetail(int courserId) async {
    var result = await Get.toNamed(BaseRouter.DETAIL_COURSER,
        arguments: {'courser_id': courserId});
    return result;
  }

  static navigateNavigationCategoryDetail(
      {int categoryId, String title}) async {
    var result = await Get.toNamed(BaseRouter.CATEGORY_DETAIL, arguments: {
      'categoryId': categoryId,
      'title': title,
    });
    return result;
  }

  static navigateMapUser({double lat, double long}) async {
    var result = await Get.toNamed(BaseRouter.MAP_USER, arguments: {
      'lat': lat,
      'long': long,
    });
    return result;
  }

  static navigateProjectParticipating() async {
    var result = await Get.toNamed(BaseRouter.PROJECT_PARTICIPATING);
    return result;
  }

  static navigateProjectParticipatingDetail() async {
    var result = await Get.toNamed(BaseRouter.PROJECT_PARTICIPATING_DETAIL);
    return result;
  }

  static navigateListRate() async {
    var result = await Get.toNamed(BaseRouter.LIST_RATE);
    return result;
  }

  static navigateRegisterContact() async {
    var result = await Get.toNamed(BaseRouter.REGISTER_CONTACT);
    return result;
  }

  static navigateListVideo() async {
    var result = await Get.toNamed(BaseRouter.LIST_VIDEO);
    return result;
  }

  static navigateNavigationUpdateLocation(
      {String email, String password, String lat, String long}) async {
    var result = await Get.toNamed(BaseRouter.UPDATE_LOCATION, arguments: {
      'email': email,
      'password': password,
      'lat': lat,
      'long': long,
    });
    return result;
  }

  static popToNews() async {
    Get.until((route) {
      if (route.settings.name == BaseRouter.WORK_NAVIGATION) {
        return true;
      }
      return false;
    });
  }

  static navigatePayment() async {
    var result = await Get.toNamed(BaseRouter.PAYMENT);
    return result;
  }
}
