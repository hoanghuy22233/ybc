import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ForgotPasswordResetEvent extends Equatable {
  const ForgotPasswordResetEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends ForgotPasswordResetEvent {
  final String email;

  const EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'EmailChanged{email: $email}';
  }
}

class PasswordChanged extends ForgotPasswordResetEvent {
  final String password;

  const PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() {
    return 'PasswordChanged{password: $password}';
  }
}

class OtpCodeChanged extends ForgotPasswordResetEvent {
  final String otpCode;

  const OtpCodeChanged({@required this.otpCode});

  @override
  List<Object> get props => [otpCode];

  @override
  String toString() {
    return 'OtpCode Changed{ OtpCode: $otpCode}';
  }
}


class ForgotPasswordResetSubmitted extends ForgotPasswordResetEvent {
  final String email;
  final String password;
  final String otpCode;

  const ForgotPasswordResetSubmitted({
    @required this.email, @required this.password, @required this.otpCode
  });

  @override
  List<Object> get props => [email, password, otpCode];

  @override
  String toString() {
    return 'ForgotPasswordResetSubmitted{email: $email, password: $password, otpCode: $otpCode}';
  }
}
