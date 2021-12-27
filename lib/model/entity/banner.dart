import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banners extends Equatable {
  int id;
  String name;
  String intro;
  String image;
  String link;
  @JsonKey(name: "location")
  String homeTop;
  int status;

  Banners(
      {this.id,
      this.name,
      this.intro,
      this.image,
      this.link,
      this.homeTop,
      this.status});

  factory Banners.fromJson(Map<String, dynamic> json) =>
      _$BannersFromJson(json);

  Map<String, dynamic> toJson() => _$BannersToJson(this);

  @override
  List<Object> get props => [id, name, intro, image, link, homeTop, status];

  @override
  String toString() {
    return 'Banners{id: $id, name: $name,intro:$intro,image:$image,link:$link,homeTop:$homeTop,status:$status}';
  }
}
