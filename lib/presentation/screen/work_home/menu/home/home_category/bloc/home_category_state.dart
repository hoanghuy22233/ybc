import 'package:equatable/equatable.dart';
import 'package:ybc/model/entity/category_menu.dart';

abstract class HomeCategoryState extends Equatable {
  const HomeCategoryState();

  @override
  List<Object> get props => [];
}

class HomeCategoryLoading extends HomeCategoryState {}

class HomeCategoryLoaded extends HomeCategoryState {
  final List<MenuCategories> menu;
  final bool hasReachedMax;

  const HomeCategoryLoaded({this.hasReachedMax, this.menu});

  HomeCategoryLoaded copyWith({
    List<MenuCategories> menu,
    bool hasReachedMax,
  }) {
    return HomeCategoryLoaded(
      menu: menu ?? this.menu,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [menu, hasReachedMax];
}

class HomeCategoryNotLoaded extends HomeCategoryState {
  final String error;

  HomeCategoryNotLoaded(this.error);

  @override
  String toString() {
    return 'HomeCategoryNotLoaded{error: $error}';
  }
}
