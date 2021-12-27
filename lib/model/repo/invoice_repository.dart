import 'package:ybc/model/api/request/barrel_request.dart';
import 'package:ybc/model/api/response/barrel_response.dart';
import 'package:ybc/model/api/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class InvoiceRepository {
  final Dio dio;

  InvoiceRepository({@required this.dio});

}
