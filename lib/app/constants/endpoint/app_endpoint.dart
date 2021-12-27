class Endpoint {
  Endpoint._();

  static const BASE_URL = 'https://clbdoanhnhantrekhoinghiep.com';
  //AUTH ROUTE

  //new
  static const NEWS = '/api/v1/posts';
  static const NEWS_DETAIL = '/api/v1/posts';
  static const BANNER = '/api/v1/banners?location=app';
  static const HOME = '/api/v1/homepage';
  static const COURSES = '/api/v1/courses';
  static const CATEGORY_COURSES = '/api/v1/categories-course';
  static const COURSER_DETAIL = '/api/v1/courses';
  static const MENU = '/api/v1/menu';
  static const THOUGHT = '/api/v1/introduce-app';

  //login
  static const LOGIN_APP = '/api/v1/admin/login';
  //register
  static const REGISTER = '/api/v1/admin/register';
  //facebook
  static const LOGIN_FACEBOOK = '/api/v1/admin/login/facebook';
  //profile
  static const PROFILE = '/api/v1/admin/profile';
  static const EDIT_PROFILE = '/api/v1/admin/profile';

  static const FORGOT_PASSWORD = '/api/v1/admin/forgot-password-by-code';
  static const FORGOT_PASSWORD_RESET = '/api/v1/admin/restore-password-by-code';
  static const CHANGE_PASSWORD = '/api/v1/admin/change-password';

  static const UPDATE_LOCATION = '/api/v1/admin/update-location';
  static const GET_ALL_USER_LOCATION = '/api/v1/admin/get-all-user';
  static const GET_INFORMATION_USER = '/api/v1/admin/profile';

  //cart
  static const ADD_ITEM_CART = '/api/v1/carts/add';
  static const REMOVE_ITEM_CART = '/api/v1/carts/remove';
  static const INFORMATION_CART = '/api/v1/carts';
  static const CREATE_ORDER = '/api/v1/orders/create';
  static const HISTORY_ORDER = '/api/v1/orders';

  static const int DEFAULT_LIMIT = 20;

  static const int DEFAULT_LIMITS = 10;

  // request failed
  static const int FAILURE = 0;

  // request success
//  static const int SUCCESS = 1;
  static const bool
  SUCCESS = true;

  // request with token expire
  static const int TOKEN_EXPIRE = 2;

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  // method
  static const GET = 'GET';
  static const POST = 'POST';
  static const PUT = 'PUT';
  static const DELETE = 'DELETE';

  // get path
  static String getPath(String path) {
    return '$BASE_URL$path';
  }
}
