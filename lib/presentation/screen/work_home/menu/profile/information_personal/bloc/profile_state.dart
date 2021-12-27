import 'package:equatable/equatable.dart';
import 'package:ybc/model/entity/user.dart';
import 'package:ybc/utils/dio/dio_status.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
}

class ProfileLoaded extends ProfileState {
  final User user;

  ProfileLoaded(this.user); //  final User user;

  @override
  List<Object> get props => [user];

  @override
  String toString() {
    return 'ProfileLoaded{user: $user}';
  }
}

class ProfileNotLoaded extends ProfileState {
  final DioStatus error;

  ProfileNotLoaded(this.error);

  @override
  String toString() {
    return 'ProfileNotLoaded{error: $error}';
  }
}
