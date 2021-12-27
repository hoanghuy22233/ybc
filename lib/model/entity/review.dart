import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'review.g.dart';

@JsonSerializable()
class Review extends Equatable {
  int id;
  @JsonKey(name: "user_name")
  String userName;
  @JsonKey(name: "user_avatar")
  String userAvatar;
  String content;
  @JsonKey(name: "number_star")
  double numberStar;

  Review(
      this.id, this.userName, this.userAvatar, this.content, this.numberStar);

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);

  @override
  List<Object> get props => [id, userName, userAvatar, content, numberStar];

  @override
  String toString() {
    return 'Review{id: $id, userName: $userName, userAvatar: $userAvatar, content: $content, numberStar: $numberStar}';
  }
}
