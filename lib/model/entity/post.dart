import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post extends Equatable {
  int id;
  String name;
  String image;

  Post({
    this.id,
    this.name,
    this.image,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        image,
      ];

  @override
  String toString() {
    return 'Banners{id: $id, name: $name,image:$image,}';
  }
}
