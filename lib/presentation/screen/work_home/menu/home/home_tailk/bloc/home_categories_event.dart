import 'package:equatable/equatable.dart';
import 'package:ybc/model/entity/barrel_entity.dart';

class HomeCategoriesEvent extends Equatable {
  const HomeCategoriesEvent();
  @override
  List<Object> get props => [];
}

class DisplayHomeCategories extends HomeCategoriesEvent {
  final List<HomeData> category;

  const DisplayHomeCategories({this.category});

  @override
  List<Object> get props => [category];
}
