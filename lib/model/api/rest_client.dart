import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/api/request/cart_add_request.dart';
import 'package:ybc/model/api/request/cart_remove_request.dart';
import 'package:ybc/model/api/request/create_invoice_request.dart';
import 'package:ybc/model/api/request/forgot_password_request.dart';
import 'package:ybc/model/api/request/forgot_password_reset_request.dart';
import 'package:ybc/model/api/request/register_app_request.dart';
import 'package:ybc/model/api/request/sort_request.dart';
import 'package:ybc/model/api/request/update_address_request.dart';
import 'package:ybc/model/api/request/update_birthday_request.dart';
import 'package:ybc/model/api/request/update_email_request.dart';
import 'package:ybc/model/api/request/update_infor_request.dart';
import 'package:ybc/model/api/request/update_information_request.dart';
import 'package:ybc/model/api/request/update_intro_request.dart';
import 'package:ybc/model/api/request/update_job_request.dart';
import 'package:ybc/model/api/request/update_location_request.dart';
import 'package:ybc/model/api/request/update_name_request.dart';
import 'package:ybc/model/api/request/update_phone_request.dart';
import 'package:ybc/model/api/request/update_suplife_request.dart';
import 'package:ybc/model/api/request/change_password_request.dart';
import 'package:ybc/model/api/response/banner_response.dart';
import 'package:ybc/model/api/response/cart_add_response.dart';
import 'package:ybc/model/api/response/cart_remove_response.dart';
import 'package:ybc/model/api/response/cart_response.dart';
import 'package:ybc/model/api/response/category_response.dart';
import 'package:ybc/model/api/response/courser_detail_response.dart';
import 'package:ybc/model/api/response/courses_courser_response.dart';
import 'package:ybc/model/api/response/courses_response.dart';
import 'package:ybc/model/api/response/create_invoice_response.dart';
import 'package:ybc/model/api/response/forgot_password_response.dart';
import 'package:ybc/model/api/response/home_response.dart';
import 'package:ybc/model/api/response/menu_response.dart';
import 'package:ybc/model/api/response/news_detail_response.dart';
import 'package:ybc/model/api/response/news_response.dart';
import 'package:ybc/model/api/response/order_data_response.dart';
import 'package:ybc/model/api/response/profile_response.dart';
import 'package:ybc/model/api/response/thought_response.dart';
import 'package:ybc/model/api/response/update_address_response.dart';
import 'package:ybc/model/api/response/update_avatar_response.dart';
import 'package:ybc/model/api/response/update_birthday_response.dart';
import 'package:ybc/model/api/response/update_email_response.dart';
import 'package:ybc/model/api/response/update_gender_response.dart';
import 'package:ybc/model/api/response/update_infor_response.dart';
import 'package:ybc/model/api/response/update_information_response.dart';
import 'package:ybc/model/api/response/update_intro_response.dart';
import 'package:ybc/model/api/response/update_job_response.dart';
import 'package:ybc/model/api/response/update_location_response.dart';
import 'package:ybc/model/api/response/update_name_response.dart';
import 'package:ybc/model/api/response/update_phone_response.dart';
import 'package:ybc/model/api/response/update_suplife_response.dart';
import 'package:ybc/model/api/response/user_location_response.dart';

import 'request/barrel_request.dart';
import 'response/barrel_response.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: Endpoint.BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST(Endpoint.LOGIN_APP)
  Future<LoginRegisterResponse> loginApp(
      @Body() LoginAppRequest loginAppRequest);

  @POST(Endpoint.LOGIN_FACEBOOK)
  Future<LoginRegisterResponse> loginFacebook(
      @Query( 'access_token') String accessToken,@Query( 'lat') String lat,@Query( 'long') String long);

  @POST(Endpoint.REGISTER)
  Future<LoginRegisterResponse> registerApp(
      @Body() RegisterAppRequest registerAppRequest);

  @POST(Endpoint.FORGOT_PASSWORD)
  Future<ForgotPasswordResponse> forgotPassword(
      @Body() ForgotPasswordRequest forgotPasswordRequest);

  @POST(Endpoint.FORGOT_PASSWORD_RESET)
  Future<ForgotPasswordResponse> forgotPasswordReset(
      @Body() ForgotPasswordResetRequest forgotPasswordResetRequest);

  @POST(Endpoint.CHANGE_PASSWORD)
  Future<ForgotPasswordResponse> changePassword(
      @Body() ChangePasswordRequest changePasswordRequest);
  //
  @GET(Endpoint.NEWS)
  Future<NewsResponse> getNews(
      @Query('category_id') int categoryId, @Query('sorts') SortRequest body);

  @GET(Endpoint.NEWS)
  Future<NewsResponse> getNewsCategory(
      @Query('sorts') SortRequest body, @Query('category_id') int categoryId);

  @GET(Endpoint.COURSES)
  Future<CoursesResponse> getCourser(
      @Query('category_id') int categoryId, @Query('sorts') SortRequest body);

  @GET(Endpoint.CATEGORY_COURSES)
  Future<CoursesCategoriesResponse> getCourserCategory();

  @GET(Endpoint.NEWS_DETAIL + "/{id}")
  Future<NewsDetailResponse> getNewsDetail(@Path("id") int id);

  @GET(Endpoint.COURSER_DETAIL + "/{id}")
  Future<CourserDetailResponse> getCourserDetail(@Path("id") int id);

  @GET(Endpoint.BANNER)
  Future<BannerResponse> getBanner();

  @GET(Endpoint.THOUGHT)
  Future<ThoughtResponse> getThought();

  @GET(Endpoint.MENU)
  Future<MenuResponse> getMenu();

  @GET(Endpoint.HOME)
  Future<HomeResponse> getHomeData();

  @GET(Endpoint.PROFILE)
  Future<ProfileResponse> getProfile();

  @GET(Endpoint.GET_ALL_USER_LOCATION)
  Future<UserLocationResponse> getUserLocation();

  @GET(Endpoint.NEWS)
  Future<CategoryResponse> getCategory(@Query('category_id') int categoryId);

  @GET(Endpoint.GET_INFORMATION_USER + "/{id}")
  Future<ProfileResponse> getInformation(@Path("id") int id);

  @GET(Endpoint.INFORMATION_CART)
    Future<CartResponse> getInformationCart(
      @Query("api_token") String apiToken,
      );

  @GET(Endpoint.HISTORY_ORDER)
    Future<OrderDataResponse> historyOrder(
      @Query("limit") int limit,
      @Query("offset") int offset,
      @Query("api_token") String apiToken,
      @Query("status") int status,
      @Query("type") int type,
      );

  // @GET(Endpoint.NEWS_DETAIL)
  // Future<NewsDetailResponse> getNewsDetail(
  //   @MultiPart() int newsId,
  // );

  @POST(Endpoint.PROFILE)
  Future<UpdateNameResponse> updateName(
      @Body() UpdateNameRequest updateNameRequest);

  @POST(Endpoint.PROFILE)
  Future<UpdatePhoneResponse> updatePhone(
      @Body() UpdatePhoneRequest updatePhoneRequest);

  @POST(Endpoint.PROFILE)
  Future<UpdateEmailResponse> updateEmail(
      @Body() UpdateEmailRequest updateEmailRequest);

  @POST(Endpoint.PROFILE)
  Future<UpdateBirthdayResponse> updateBirthday(
      @Body() UpdateBirthdayRequest updateBirthdayRequest);

  @POST(Endpoint.PROFILE)
  Future<UpdateAvatarResponse> updateAvatar(
      @Part(name: 'image') File avatarFile);

  @POST(Endpoint.PROFILE)
  Future<UpdateAddressResponse> updateAddress(
      @Body() UpdateAddressRequest updateAddressRequest);

  @POST(Endpoint.PROFILE)
  Future<UpdateGenderResponse> genDer(
    @Part(name: 'gender') int superId,
  );

  @POST(Endpoint.PROFILE)
  Future<UpdateInformationResponse> updateInformation(
      @Body() UpdateInformationRequest updateInformationRequest);

  @POST(Endpoint.PROFILE)
  Future<UpdateSuplifeResponse> updateSuplife(
      @Body() UpdateSuplifeRequest updateAddressRequest);

  @POST(Endpoint.PROFILE)
  Future<UpdateInforResponse> updateInfo(
      @Body() UpdateInforRequest updateInforRequest);

  @POST(Endpoint.PROFILE)
  Future<UpdateJobResponse> updateJob(
      @Body() UpdateJobRequest updateJobRequest);

  @POST(Endpoint.PROFILE)
  Future<UpdateIntroResponse> updateIntro(
      @Body() UpdateIntroRequest updateIntroRequest);

  @POST(Endpoint.UPDATE_LOCATION)
  Future<UpdateLocationResponse> updateLocation(
      @Body() UpdateLocationRequest updateLocationRequest);

  @POST(Endpoint.ADD_ITEM_CART)
  Future<CartAddResponse> cartAdd(
      @Body() CartAddRequest cartAddRequest);

  @POST(Endpoint.REMOVE_ITEM_CART)
  Future<CartRemoveResponse> cartRemove(
      @Body() CartRemoveRequest cartRemoveRequest);

  //dung cho param
  // @POST(Endpoint.UPDATE_LOCATION)
  // Future<UpdateLocationResponse> updateLocation(
  //     @Part(name: "lat") String email,
  //     @Part(name: "lat") String password,
  //     @Part(name: "long") String apiToken,
  //     @Part(name: "lat") String lat,
  //     @Part(name: "long") String long,
  //     );

  @POST(Endpoint.CREATE_ORDER)
  Future<CreateInvoiceResponse> createInvoiceBody(
      @Body() CreateInvoiceRequest createInvoiceRequest);
}
