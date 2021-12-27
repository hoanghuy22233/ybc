import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserLocationEvent extends Equatable {
  const UserLocationEvent();

  List<Object> get props => [];
}

class LoadUserLocation extends UserLocationEvent {
}

class RefreshUserLocation extends UserLocationEvent {}
