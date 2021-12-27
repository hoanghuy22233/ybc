import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  List<Object> get props => [];
}

class LoadHome extends HomeEvent {
}

class RefreshHome extends HomeEvent {}
