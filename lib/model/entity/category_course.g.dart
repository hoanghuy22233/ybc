// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

categoryCourse _$categoryCourseFromJson(Map<String, dynamic> json) {
  return categoryCourse(
    json['id'] as int,
    json['name'] as String,
    json['image'] as String,
    json['company_id'] as int,
    json['slug'] as String,
    json['content'] as String,
    json['intro'] as String,
    json['parent_id'] as int,
    json['user_id'] as int,
    json['status'] as int,
    json['type'] as int,
    json['type_show'] as int,
    json['location'] as String,
    json['order_no'] as int,
    json['created_at'] as String,
    json['updated_at'] as String,
    json['show_menu'] as String,
    (json['banner'] as List)
        ?.map((e) =>
            e == null ? null : Banners.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['featured'] as int,
    json['banner_sidebar'] as String,
    json['show_homepage'] as String,
    json['meta_title'] as String,
    json['meta_keywords'] as String,
    json['meta_description'] as String,
    json['filters'] as String,
    json['banner_child'],
    json['title_banner_child'],
    json['description_banner_child'],
    json['banner_child_left'],
    json['featured_description'] as String,
    json['video'] as String,
    json['fields_id_product'] as int,
    json['properties_name_id'] as int,
    json['allows_users_create'] as int,
    json['style'] as int,
    json['discount'] as int,
    json['discount_enable'] as int,
    json['category_product_id'] as int,
    json['template'] as String,
  );
}

Map<String, dynamic> _$categoryCourseToJson(categoryCourse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'company_id': instance.companyId,
      'slug': instance.slug,
      'content': instance.content,
      'intro': instance.intro,
      'parent_id': instance.parentId,
      'user_id': instance.userId,
      'status': instance.status,
      'type': instance.type,
      'type_show': instance.typeShow,
      'location': instance.location,
      'order_no': instance.orderNo,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'show_menu': instance.showMenu,
      'banner': instance.banner,
      'featured': instance.featured,
      'banner_sidebar': instance.bannerSidebar,
      'show_homepage': instance.showHomepage,
      'meta_title': instance.metaTitle,
      'meta_keywords': instance.metaKeywords,
      'meta_description': instance.metaDescription,
      'filters': instance.filters,
      'banner_child': instance.bannerChild,
      'title_banner_child': instance.titleBannerChild,
      'description_banner_child': instance.descriptionBannerChild,
      'banner_child_left': instance.bannerChildLeft,
      'featured_description': instance.featuredDescription,
      'video': instance.video,
      'fields_id_product': instance.fieldsIdProduct,
      'properties_name_id': instance.propertiesNameId,
      'allows_users_create': instance.allowsUsersCreate,
      'style': instance.style,
      'discount': instance.discount,
      'discount_enable': instance.discountEnable,
      'category_product_id': instance.categoryProductId,
      'template': instance.template,
    };
