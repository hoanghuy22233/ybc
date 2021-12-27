import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_detail.g.dart';

@JsonSerializable()
class NewsDetail extends Equatable {
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "intro")
  String intro;
  @JsonKey(name: "multi_cat")
  String multiCat;
  @JsonKey(name: "content")
  String content;
  @JsonKey(name: "product_sidebar")
  String productSidebar;

  NewsDetail(this.id, this.name, this.image, this.createdAt, this.intro,
      this.multiCat, this.content, this.productSidebar);

  factory NewsDetail.fromJson(Map<String, dynamic> json) =>
      _$NewsDetailFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDetailToJson(this);

  @override
  List<Object> get props =>
      [id, name, image, createdAt, intro, multiCat, content, productSidebar];

  @override
  String toString() {
    return 'NewsDetail{id: $id, name: $name, image: $image,created:$createdAt, intro: $intro,multicat:$multiCat,content:$content,productSidebar:$productSidebar}';
  }
}
