import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/category_menu.dart';

import 'base_response.dart';

part 'menu_response.g.dart';

@JsonSerializable()
class MenuResponse extends BaseResponse {
  List<MenuCategories> data;

  MenuResponse(this.data);

  factory MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MenuResponseToJson(this);
}
