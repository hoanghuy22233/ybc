class AppNetWork {
  AppNetWork._();

  static const content_type = 'Content-Type';
  ////////////////////////////////////////////////////////
  static const multipart_form_data = 'multipart/form-data';

  static const auth_type = 'Authorization';
  ////////////////////////////////////////////////////////
  static String bearer(String token) => 'Bearer $token';

}