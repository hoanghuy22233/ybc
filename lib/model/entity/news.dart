import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News extends Equatable {
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "intro")
  String intro;

  News(this.id, this.name, this.image, this.createdAt, this.intro);

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);

  @override
  List<Object> get props => [id, name, image, createdAt, intro];

  @override
  String toString() {
    return 'News{id: $id, name: $name, image: $image,created:$createdAt, intro: $intro,}';
  }
}
