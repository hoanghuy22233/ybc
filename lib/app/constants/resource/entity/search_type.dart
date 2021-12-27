import 'package:equatable/equatable.dart';

class SearchType extends Equatable {
  final int id;
  final String name;

  SearchType(this.id, this.name);

  static final SearchType product = SearchType(1, 'Lịch sử tìm kiếm sản phẩm');
  static final SearchType news = SearchType(2, 'Lịch sử tìm kiếm tin tức');


  @override
  String toString() {
    return 'SearchType{id: $id, name: $name}';
  }

  @override
  List<Object> get props => [id, name];
}
