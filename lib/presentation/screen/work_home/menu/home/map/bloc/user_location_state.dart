

import 'package:equatable/equatable.dart';
import 'package:ybc/model/entity/user_location.dart';
import 'package:ybc/utils/dio/dio_status.dart';

abstract class UserLocationState extends Equatable {
  const UserLocationState();

  @override
  List<Object> get props => [];
}

class UserLocationLoading extends UserLocationState {
}

class UserLocationLoaded extends UserLocationState {
  final List<UserLocation> user;

  UserLocationLoaded(this.user); //  final User user;

  @override
  List<Object> get props => [user];

  @override
  String toString() {
    return 'UserLocationLoaded{user: $user}';
  }
}

class UserLocationNotLoaded extends UserLocationState {
  final DioStatus error;

  UserLocationNotLoaded(this.error);

  @override
  String toString() {
    return 'UserLocationNotLoaded{error: $error}';
  }
}
