import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/category_course.dart';

part 'courses_detail.g.dart';

@JsonSerializable()
class CourseDetail extends Equatable {
  int id;
  String name;
  String image;
  String intro;
  String content;
  String slug;
  @JsonKey(name: "multi_cat")
  String multiCat;
  @JsonKey(name: "base_price")
  double basePrice;
  @JsonKey(name: "final_price")
  double finalPrice;
  int status;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "updated_at")
  String updatedAt;
  String time;
  @JsonKey(name: "meta_title")
  String metaTitle;
  @JsonKey(name: "meta_description")
  String metaDescription;
  @JsonKey(name: "company_id")
  int companyId;
  @JsonKey(name: "category_id")
  int categoryId;
  @JsonKey(name: "order_no")
  int orderNo;
  @JsonKey(name: "menu_id")
  int menuId;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "level")
  String level;
  @JsonKey(name: "utilities")
  String utilities;
  @JsonKey(name: "date_of_possession")
  String dateOfPossession;
  @JsonKey(name: "certificate")
  int certificate;
  @JsonKey(name: "tags")
  String tags;
  @JsonKey(name: "document")
  dynamic document;
  // @JsonKey(name: "lecturer")
  // Lecturer lecturer;
  @JsonKey(name: "category")
  categoryCourse category;

  CourseDetail(
      this.id,
      this.name,
      this.image,
      this.intro,
      this.content,
      this.slug,
      this.multiCat,
      this.basePrice,
      this.finalPrice,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.time,
      this.metaTitle,
      this.metaDescription,
      this.companyId,
      this.categoryId,
      this.orderNo,
      this.menuId,
      this.type,
      this.level,
      this.utilities,
      this.dateOfPossession,
      this.certificate,
      this.tags,
      this.document,
      //  this.lecturer,
      this.category);

  factory CourseDetail.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        image,
        intro,
        content,
        slug,
        multiCat,
        basePrice,
        finalPrice,
        status,
        createdAt,
        updatedAt,
        time,
        metaTitle,
        metaDescription,
        companyId,
        categoryId,
        orderNo,
        menuId,
        type,
        level,
        utilities,
        dateOfPossession,
        certificate,
        tags,
        document,
        //   lecturer,
        category
      ];

  @override
  String toString() {
    return 'Category{id: $id, name: $name, image: $image, intro: $intro,content:$content,slug:$slug,multiCat:$multiCat,basePrice:$basePrice,finalPrice:$finalPrice,status:$status,createdAt:$createdAt,updatedAt:$updatedAt,time:$time,metaTitle:$metaTitle,metaDescription:$metaDescription,companyId:$companyId,categoryId:$categoryId,orderNo:$orderNo,menuId:$menuId,type:$type,level:$level,utilities:$utilities,dateOfPossession:$dateOfPossession,certificate:$certificate,tags:$tags,document:$document,category:$category}';
  }
}
