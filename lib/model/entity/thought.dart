import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thought.g.dart';

@JsonSerializable()
class Thought extends Equatable {
  String name;
  String image;
  String content;

  Thought({
    this.content,
    this.name,
    this.image,
  });

  factory Thought.fromJson(Map<String, dynamic> json) =>
      _$ThoughtFromJson(json);

  Map<String, dynamic> toJson() => _$ThoughtToJson(this);

  @override
  List<Object> get props => [content, name, image];

  @override
  String toString() {
    return 'Banners{content: $content, name: $name,image:$image,}';
  }
}
