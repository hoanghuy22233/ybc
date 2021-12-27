import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'search.g.dart';

@JsonSerializable()
class Search extends Equatable {
  int id;
  int type;
  @JsonKey(name: "search_word")
  String searchWord;
  @JsonKey(name: "created_at")
  String createdAt;


  Search(this.id, this.type, this.searchWord, this.createdAt);

  factory Search.fromJson(Map<String, dynamic> json) =>
      _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);

  @override
  List<Object> get props => [
    id,
   type,searchWord,createdAt
  ];

  @override
  String toString() {
    return 'Search{id: $id, type: $type, searchWord: $searchWord, createdAt: $createdAt}';
  }
}
