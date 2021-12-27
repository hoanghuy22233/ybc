import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ybc/model/entity/banner.dart';

part 'category_course.g.dart';

@JsonSerializable()
class categoryCourse extends Equatable {
  int id;
  String name;
  String image;
  @JsonKey(name: "company_id")
  int companyId;
  String slug;
  String content;
  String intro;
  @JsonKey(name: "parent_id")
  int parentId;
  @JsonKey(name: "user_id")
  int userId;
  int status;
  int type;
  @JsonKey(name: "type_show")
  int typeShow;
  String location;
  @JsonKey(name: "order_no")
  int orderNo;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "updated_at")
  String updatedAt;
  @JsonKey(name: "show_menu")
  String showMenu;
  @JsonKey(name: "banner")
  List<Banners> banner;
  @JsonKey(name: "featured")
  int featured;
  @JsonKey(name: "banner_sidebar")
  String bannerSidebar;
  @JsonKey(name: "show_homepage")
  String showHomepage;
  @JsonKey(name: "meta_title")
  String metaTitle;
  @JsonKey(name: "meta_keywords")
  String metaKeywords;
  @JsonKey(name: "meta_description")
  String metaDescription;
  @JsonKey(name: "filters")
  String filters;
  @JsonKey(name: "banner_child")
  dynamic bannerChild;
  @JsonKey(name: "title_banner_child")
  dynamic titleBannerChild;
  @JsonKey(name: "description_banner_child")
  dynamic descriptionBannerChild;
  @JsonKey(name: "banner_child_left")
  dynamic bannerChildLeft;
  @JsonKey(name: "featured_description")
  String featuredDescription;
  @JsonKey(name: "video")
  String video;
  @JsonKey(name: "fields_id_product")
  int fieldsIdProduct;
  @JsonKey(name: "properties_name_id")
  int propertiesNameId;
  @JsonKey(name: "allows_users_create")
  int allowsUsersCreate;
  @JsonKey(name: "style")
  int style;
  @JsonKey(name: "discount")
  int discount;
  @JsonKey(name: "discount_enable")
  int discountEnable;
  @JsonKey(name: "category_product_id")
  int categoryProductId;
  @JsonKey(name: "template")
  String template;

  categoryCourse(
      this.id,
      this.name,
      this.image,
      this.companyId,
      this.slug,
      this.content,
      this.intro,
      this.parentId,
      this.userId,
      this.status,
      this.type,
      this.typeShow,
      this.location,
      this.orderNo,
      this.createdAt,
      this.updatedAt,
      this.showMenu,
      this.banner,
      this.featured,
      this.bannerSidebar,
      this.showHomepage,
      this.metaTitle,
      this.metaKeywords,
      this.metaDescription,
      this.filters,
      this.bannerChild,
      this.titleBannerChild,
      this.descriptionBannerChild,
      this.bannerChildLeft,
      this.featuredDescription,
      this.video,
      this.fieldsIdProduct,
      this.propertiesNameId,
      this.allowsUsersCreate,
      this.style,
      this.discount,
      this.discountEnable,
      this.categoryProductId,
      this.template);

  factory categoryCourse.fromJson(Map<String, dynamic> json) =>
      _$categoryCourseFromJson(json);

  Map<String, dynamic> toJson() => _$categoryCourseToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        image,
        companyId,
        slug,
        content,
        intro,
        parentId,
        userId,
        status,
        type,
        typeShow,
        location,
        orderNo,
        createdAt,
        updatedAt,
        showMenu,
        banner,
        featured,
        bannerSidebar,
        showHomepage,
        metaTitle,
        metaKeywords,
        metaDescription,
        filters,
        bannerChild,
        titleBannerChild,
        descriptionBannerChild,
        bannerChildLeft,
        featuredDescription,
        video,
        fieldsIdProduct,
        propertiesNameId,
        allowsUsersCreate,
        style,
        discount,
        discountEnable,
        categoryProductId,
        template
      ];

  @override
  String toString() {
    return 'categoryCourse{id: $id, name: $name, image: $image}';
  }
}
