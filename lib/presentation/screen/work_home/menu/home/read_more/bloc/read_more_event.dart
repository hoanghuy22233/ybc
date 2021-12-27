import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CategoryDetailEvent extends Equatable {
  const CategoryDetailEvent();

  List<Object> get props => [];
}

class LoadCategoryDetail extends CategoryDetailEvent {
  final int categoryId;

  LoadCategoryDetail(this.categoryId);

  @override
  String toString() {
    return 'LoadCategoryDetail{categoryId: $categoryId}';
  }

  List<Object> get props => [categoryId];
}

class RefreshCategoryDetail extends CategoryDetailEvent {
  final int categoryId;

  RefreshCategoryDetail(this.categoryId);

  @override
  String toString() {
    return 'RefreshCategoryDetail{categoryId: $categoryId}';
  }

  List<Object> get props => [categoryId];
}
