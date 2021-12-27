import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:ybc/model/entity/post_detail.dart';

part 'category_detail.g.dart';

@JsonSerializable()
class CategoryDetail extends Equatable {
  @JsonKey(name: "current_page")
  int currentPage;
  List<PostDetail> data;
  @JsonKey(name: "first_page_url")
  String firstPageUrl;
  @JsonKey(name: "from")
  int from;
  @JsonKey(name: "last_page")
  int lastPage;
  @JsonKey(name: "last_page_url")
  String lastPageUrl;
  @JsonKey(name: "next_page_url")
  String nextPageUrl;
  @JsonKey(name: "path")
  String path;
  @JsonKey(name: "per_page")
  int perPage;
  @JsonKey(name: "prev_page_url")
  String prevPageUrl;
  @JsonKey(name: "to")
  int to;
  @JsonKey(name: "total")
  int total;


  CategoryDetail(
      this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total);

  factory CategoryDetail.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDetailToJson(this);

  @override
  List<Object> get props => [currentPage, data, firstPageUrl, from, lastPage, lastPageUrl,nextPageUrl,path, perPage, prevPageUrl, to, total];

  @override
  String toString() {
    return 'Category{currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, from: $from, lastPage: $lastPage, lastPageUrl: $lastPageUrl,nextPageUrl: $nextPageUrl,path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to, total: $total}';
  }
}
