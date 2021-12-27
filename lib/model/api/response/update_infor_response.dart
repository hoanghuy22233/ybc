import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/api/response/barrel_response.dart';

part 'update_infor_response.g.dart';

@JsonSerializable()
class UpdateInforResponse extends BaseResponse {
  UpdateInforResponse();

  factory UpdateInforResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateInforResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateInforResponseToJson(this);
}
