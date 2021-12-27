import 'package:equatable/equatable.dart';
import 'package:ybc/model/entity/category_detail.dart';
import 'package:ybc/model/entity/user.dart';
import 'package:ybc/utils/dio/dio_status.dart';

abstract class InformationUserState extends Equatable {
  const InformationUserState();

  @override
  List<Object> get props => [];
}

class InformationUserLoading extends InformationUserState {
}

class InformationUserLoaded extends InformationUserState {
  final User userDetail;

  InformationUserLoaded(this.userDetail); //  final User user;

  @override
  List<Object> get props => [userDetail];

  @override
  String toString() {
    return 'InformationUserLoaded{user: $userDetail}';
  }
}

class InformationUserNotLoaded extends InformationUserState {
  final DioStatus error;

  InformationUserNotLoaded(this.error);

  @override
  String toString() {
    return 'InformationUserNotLoaded{error: $error}';
  }
}
