import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/category_course.dart';
import 'package:ybc/model/entity/lecturer.dart';

part 'order_item.g.dart';

@JsonSerializable()
class OrderItem extends Equatable {
  int id;
  @JsonKey(name: "course_id")
  int courseId;
  String name;
  String intro;
  String image;
  @JsonKey(name: "base_price")
  double basePrice;
  @JsonKey(name: "final_price")
  double finalPrice;
  @JsonKey(name: "lecturer_name")
  String lecturerName;
  @JsonKey(name: "total_price")
  double totalPrice;
  @JsonKey(name: "type")
  int type;
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "created_at")
  String createdAt;


  OrderItem(
      this.id,
      this.courseId,
      this.name,
      this.intro,
      this.image,
      this.basePrice,
      this.finalPrice,
      this.lecturerName,
      this.totalPrice,
      this.type,
      this.status,
      this.createdAt);

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);

  @override
  List<Object> get props => [
    id,
    courseId,
    name,
    intro,
    image,
    basePrice,
    finalPrice,
    lecturerName,
    totalPrice,
    type,
    status,
    createdAt
      ];

  @override
  String toString() {
    return 'OrderItem {id: $id, courseId: $courseId, name: $name, intro: $intro, image: $image ,basePrice:$basePrice,finalPrice:$finalPrice, lecturerName:$lecturerName, totalPrice:$totalPrice, type:$type, status:$status, createdAt:$createdAt}';
  }
}
