import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ProfileEvent extends Equatable {
  const ProfileEvent();

  List<Object> get props => [];
}

class LoadProfile extends ProfileEvent {

}

class RefreshProfile extends ProfileEvent {}
