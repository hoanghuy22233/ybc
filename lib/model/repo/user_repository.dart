import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:meta/meta.dart';
import 'package:ybc/model/api/request/barrel_request.dart';
import 'package:ybc/model/api/request/cart_add_request.dart';
import 'package:ybc/model/api/request/cart_remove_request.dart';
import 'package:ybc/model/api/request/create_invoice_request.dart';
import 'package:ybc/model/api/request/forgot_password_request.dart';
import 'package:ybc/model/api/request/forgot_password_reset_request.dart';
import 'package:ybc/model/api/request/register_app_request.dart';
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
import 'package:ybc/model/api/response/barrel_response.dart';
import 'package:ybc/model/api/response/cart_add_response.dart';
import 'package:ybc/model/api/response/cart_remove_response.dart';
import 'package:ybc/model/api/response/cart_response.dart';
import 'package:ybc/model/api/response/create_invoice_response.dart';
import 'package:ybc/model/api/response/forgot_password_response.dart';
import 'package:ybc/model/api/response/order_data_response.dart';
import 'package:ybc/model/api/response/profile_response.dart';
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
import 'package:ybc/model/api/rest_client.dart';

class UserRepository {
  final Dio dio;

  UserRepository({@required this.dio});
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  final facebookLogin = FacebookLogin();

  Future<LoginRegisterResponse> loginApp(
      {@required String username,
      @required String password,
      @required String lat,
      @required String long}) async {
    final client = RestClient(dio);
    return client.loginApp(LoginAppRequest(
        email: username, password: password, lat: lat, long: long));
  }

  Future<LoginRegisterResponse> loginFacebook(
      {@required String accessToken,
      @required String lat,
      @required String long}) async {
    final client = RestClient(dio);
    return client.loginFacebook(accessToken, lat ?? '10', long ?? '20');
  }

  Future<String> facebookAccessToken() async {
    facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    var accessToken = '';
    final FacebookLoginResult result = await facebookLogin.logIn(['email']);
    if (await facebookLogin.isLoggedIn) {
      accessToken = result.accessToken.token;
      print('____accessToken_______');
      print('facebookUser.authentication $accessToken');
    }
    return accessToken;
  }

  Future<LoginRegisterResponse> registerApp(
      {@required String name,
      @required String email,
      @required String tel,
      @required String password}) async {
    final client = RestClient(dio);
    return client.registerApp(RegisterAppRequest(
        name: name, email: email, tel: tel, password: password));
  }

  Future<ForgotPasswordResponse> forgotPassword(
      {@required String email}) async {
    final client = RestClient(dio);
    return client.forgotPassword(ForgotPasswordRequest(email: email));
  }

  Future<ForgotPasswordResponse> forgotPasswordReset(
      {@required String email, @required String password, @required String codeChangePassword}) async {
    final client = RestClient(dio);
    return client.forgotPasswordReset(ForgotPasswordResetRequest(email: email, password: password, codeChangePassword: codeChangePassword));
  }

  Future<ForgotPasswordResponse> changePassword(
      {@required String apiToken, @required String newPassword, @required String oldPassword}) async {
    final client = RestClient(dio);
    return client.changePassword(ChangePasswordRequest(apiToken: apiToken, newPassword: newPassword, oldPassword: oldPassword));
  }

  Future<ProfileResponse> getProfile() async {
    final client = RestClient(dio);
    return client.getProfile();
  }

  Future<UserLocationResponse> getUserLocation() async {
    final client = RestClient(dio);
    return client.getUserLocation();
  }

  Future<ProfileResponse> getInformation({@required int id}) async {
    final client = RestClient(dio);
    return client.getInformation(id);
  }

  Future<CartResponse> getInformationCart({@required String apiToken}) async {
    final client = RestClient(dio);
    return client.getInformationCart(apiToken);
  }

  Future<OrderDataResponse> historyOrder({
    @required int limit,
    @required int offset,
    @required String apiToken,
    @required int status,
    @required int type}) async {
    final client = RestClient(dio);
    return client.historyOrder(limit, offset, apiToken, status, type);
  }

  // Future<void> signOut() async {
  //   return Future.wait([_googleSignIn.signOut(), facebookLogin.logOut()]);
  // }
  Future<UpdateNameResponse> updateName({@required String name}) async {
    final client = RestClient(dio);
    return client.updateName(UpdateNameRequest(name: name));
  }

  Future<UpdatePhoneResponse> updatePhone({
    @required String phone,
  }) async {
    final client = RestClient(dio);
    return client.updatePhone(UpdatePhoneRequest(phoneNumber: phone));
  }

  Future<UpdateEmailResponse> updateEmail({
    @required String email,
  }) async {
    final client = RestClient(dio);
    return client.updateEmail(UpdateEmailRequest(email: email));
  }

  Future<UpdateBirthdayResponse> updateBirthDay(
      {@required String birthDay}) async {
    final client = RestClient(dio);
    return client.updateBirthday(UpdateBirthdayRequest(dateOfBirth: birthDay));
  }

  Future<UpdateAvatarResponse> updateAvatar({@required File avatarFile}) async {
    final client = RestClient(dio);
    return client.updateAvatar(avatarFile);
  }

  Future<UpdateAddressResponse> updateAddress({
    @required String address,
  }) async {
    final client = RestClient(dio);
    return client.updateAddress(UpdateAddressRequest(address: address));
  }

  Future<UpdateGenderResponse> genDer({@required int superId}) async {
    final client = RestClient(dio);
    return client.genDer(superId);
  }

  Future<UpdateSuplifeResponse> updateSuplife({
    @required String suplife,
  }) async {
    final client = RestClient(dio);
    return client.updateSuplife(UpdateSuplifeRequest(suplife: suplife));
  }

  Future<UpdateInforResponse> updateInfor({
    @required String infor,
  }) async {
    final client = RestClient(dio);
    return client.updateInfo(UpdateInforRequest(infor: infor));
  }

  Future<UpdateJobResponse> updateJob({
    @required String job,
  }) async {
    final client = RestClient(dio);
    return client.updateJob(UpdateJobRequest(job: job));
  }

  Future<UpdateIntroResponse> updateIntro({
    @required String intro,
  }) async {
    final client = RestClient(dio);
    return client.updateIntro(UpdateIntroRequest(intro: intro));
  }

  Future<UpdateInformationResponse> updateInformation({
    @required String name,
    @required String tel,
    @required String email,
    @required String dob,
    @required String address,
    @required String job,
    @required String intro,
    @required int gender,
  }) async {
    final client = RestClient(dio);
    return client.updateInformation(UpdateInformationRequest(
        name: name,
        tel: tel,
        email: email,
        birthday: dob,
        address: address,
        job: job,
        intro: intro,
        gender: gender));
  }

  Future<UpdateLocationResponse> updateLocation({
    @required String apiToken,
    @required String lat,
    @required String long,
  }) async {
    final client = RestClient(dio);
    return client.updateLocation(UpdateLocationRequest(apiToken, lat, long));
  }

  Future<CartAddResponse> cartAdd(
      {@required int courseId, @required String apiToken}) async {
    final client = RestClient(dio);
    return client.cartAdd(CartAddRequest(courseId, apiToken));
  }

  Future<CartRemoveResponse> cartRemove(
      {@required int cartId, @required String apiToken}) async {
    final client = RestClient(dio);
    return client.cartRemove(CartRemoveRequest(cartId, apiToken));
  }

  Future<CreateInvoiceResponse> createInvoiceBody({
    @required String name,
    @required String email,
    @required String address,
    @required int cityId,
    @required int districtId,
    @required int paymentType,
    @required int wardId,
    @required String tel,
    @required String apiToken,
  }) async {
    final client = RestClient(dio);
    return client.createInvoiceBody(CreateInvoiceRequest(
      name,
      email,
      address,
      cityId,
      districtId,
      wardId,
      tel,
      paymentType,
      apiToken,
    ));
  }
}
