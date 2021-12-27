import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:ybc/model/entity/post.dart';

part 'home_data.g.dart';

@JsonSerializable()
class HomeData extends Equatable {
  int id;
  String name;
  @JsonKey(name: "posts")
  List<Post> post;

  HomeData({this.id, this.name, this.post});

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);

  @override
  List<Object> get props => [id, name, post];
}
