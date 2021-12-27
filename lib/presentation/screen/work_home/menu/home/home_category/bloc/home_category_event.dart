import 'package:equatable/equatable.dart';

class HomeCategoryEvent extends Equatable {
  const HomeCategoryEvent();

  List<Object> get props => [];
}

class LoadHomeCategory extends HomeCategoryEvent {}

class RefreshHomeCategory extends HomeCategoryEvent {}
