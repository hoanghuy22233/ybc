import 'package:equatable/equatable.dart';
import 'package:ybc/model/entity/category_detail.dart';
import 'package:ybc/model/entity/user.dart';
import 'package:ybc/utils/dio/dio_status.dart';

abstract class CategoryDetailState extends Equatable {
  const CategoryDetailState();

  @override
  List<Object> get props => [];
}

class CategoryDetailLoading extends CategoryDetailState {
}

class CategoryDetailLoaded extends CategoryDetailState {
  final CategoryDetail categoryDetail;

  CategoryDetailLoaded(this.categoryDetail); //  final User user;

  @override
  List<Object> get props => [categoryDetail];

  @override
  String toString() {
    return 'CategoryDetailLoaded{user: $categoryDetail}';
  }
}

class CategoryDetailNotLoaded extends CategoryDetailState {
  final DioStatus error;

  CategoryDetailNotLoaded(this.error);

  @override
  String toString() {
    return 'CategoryDetailNotLoaded{error: $error}';
  }
}
