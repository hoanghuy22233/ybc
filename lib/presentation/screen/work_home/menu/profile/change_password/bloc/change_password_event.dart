import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class OldPasswordChanged extends ChangePasswordEvent {
  final String oldPassword;

  const OldPasswordChanged({@required this.oldPassword});

  @override
  List<Object> get props => [oldPassword];

  @override
  String toString() {
    return 'OldPasswordChanged{password: $oldPassword}';
  }
}

class NewPasswordChanged extends ChangePasswordEvent {
  final String newPassword;

  const NewPasswordChanged({@required this.newPassword});

  @override
  List<Object> get props => [newPassword];

  @override
  String toString() {
    return 'NewPasswordChanged{ newPassword: $newPassword}';
  }
}

class ConfirmNewPasswordChanged extends ChangePasswordEvent {
  final String confirmNewPassword;

  const ConfirmNewPasswordChanged({@required this.confirmNewPassword});

  @override
  List<Object> get props => [confirmNewPassword];

  @override
  String toString() {
    return 'ConfirmNewPasswordChanged {confirmNewPassword: $confirmNewPassword}';
  }
}


class ChangePasswordSubmitted extends ChangePasswordEvent {
  final String apiToken;
  final String oldPassword;
  final String newPassword;

  const ChangePasswordSubmitted({
    @required this.apiToken, @required this.oldPassword, @required this.newPassword
  });

  @override
  List<Object> get props => [apiToken, oldPassword, newPassword];

  @override
  String toString() {
    return 'ChangePasswordSubmitted{email: $apiToken, password: $oldPassword, otpCode: $newPassword}';
  }
}
