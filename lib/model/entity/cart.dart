import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart extends Equatable {
  int id;
  @JsonKey(name: "admin_id")
  int adminId;
  @JsonKey(name: "course_id")
  int courseId;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "updated_at")
  String updatedAt;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "intro")
  String intro;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "base_price")
  double basePrice;
  @JsonKey(name: "final_price")
  double finalPrice;
  @JsonKey(name: "lecturer_name")
  String lecturerName;
  @JsonKey(name: "category_name")
  String categoryName;

  Cart(
      this.id,
      this.adminId,
      this.courseId,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.intro,
      this.image,
      this.basePrice,
      this.finalPrice,
      this.lecturerName,
      this.categoryName);

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  get productDistribute => null;

  Map<String, dynamic> toJson() => _$CartToJson(this);

  @override
  List<Object> get props => [
        id,
        adminId,
        courseId,
        createdAt,
        updatedAt,
        name,
        intro,
        image,
        basePrice,
        finalPrice,
        lecturerName,
        categoryName
      ];

  @override
  String toString() {
    return 'Cart{id: $id, adminId: $adminId, courseId: $courseId, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, intro: $intro, image: $image, basePrice: $basePrice, finalPrice: $finalPrice, lecturerName: $lecturerName, categoryName: $categoryName}';
  }
}
