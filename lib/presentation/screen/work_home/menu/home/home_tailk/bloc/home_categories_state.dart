import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ybc/model/entity/barrel_entity.dart';

abstract class HomeCategoriesState extends Equatable {
  const HomeCategoriesState();

  @override
  List<Object> get props => [];
}

class HomeCategoriesNotLoaded extends HomeCategoriesState {}

class HomeCategoriesLoaded extends HomeCategoriesState {
  final List<HomeData> category;

  HomeCategoriesLoaded({@required this.category});

  @override
  List<Object> get props => [category];
}
