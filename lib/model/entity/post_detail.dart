import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_detail.g.dart';

@JsonSerializable()
class PostDetail extends Equatable {
  int id;
  String name;
  String image;
  @JsonKey(name: "created_at")
  String createdAt;
  String intro;
  @JsonKey(name: "multi_cat")
  String multiCat;
  @JsonKey(name: "category_id")
  int categoryId;

  PostDetail(
      {this.id,
      this.name,
      this.image,
      this.createdAt,
      this.intro,
      this.multiCat,
      this.categoryId});

  factory PostDetail.fromJson(Map<String, dynamic> json) =>
      _$PostDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PostDetailToJson(this);

  @override
  List<Object> get props =>
      [id, name, image, createdAt, intro, multiCat, categoryId];

  @override
  String toString() {
    return 'Banners{id: $id, name: $name,image:$image, createAt: $createdAt, intro:$intro, multiCat: $multiCat, categoryId:$categoryId}';
  }
}
