import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class InformationUserEvent extends Equatable {
  const InformationUserEvent();

  List<Object> get props => [];
}

class LoadInformationUser extends InformationUserEvent {
  final int userId;

  LoadInformationUser(this.userId);

  @override
  String toString() {
    return 'LoadInformationUser{userId: $userId}';
  }

  List<Object> get props => [userId];
}

class RefreshInformationUser extends InformationUserEvent {
  final int userId;

  RefreshInformationUser(this.userId);

  @override
  String toString() {
    return 'RefreshInformationUser{userId: $userId}';
  }

  List<Object> get props => [userId];
}

