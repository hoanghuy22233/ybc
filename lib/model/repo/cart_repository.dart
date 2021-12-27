import 'package:ybc/model/api/response/barrel_response.dart';
import 'package:ybc/model/api/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class CartRepository {
  final Dio dio;

  CartRepository({@required this.dio});

}
