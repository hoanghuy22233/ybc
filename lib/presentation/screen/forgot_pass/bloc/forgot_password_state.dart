import 'package:flutter/cupertino.dart';

class ForgotPasswordState {
  final bool isUsernameValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  bool get isFormValid =>
      isUsernameValid;

  ForgotPasswordState(
      {@required this.isUsernameValid,
        @required this.isSubmitting,
        @required this.isSuccess,
        @required this.isFailure,
        @required this.message});

  factory ForgotPasswordState.empty() {
    return ForgotPasswordState(
        isUsernameValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ForgotPasswordState.loading() {
    return ForgotPasswordState(
        isUsernameValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ForgotPasswordState.failure({String message}) {
    return ForgotPasswordState(
        isUsernameValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message);
  }

  factory ForgotPasswordState.success({String message}) {
    return ForgotPasswordState(
        isUsernameValid: true,
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        message: message);
  }

  ForgotPasswordState update(
      {bool isUsernameValid}) {
    return copyWith(
      isUsernameValid: isUsernameValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  ForgotPasswordState copyWith({
    bool isUsernameValid,
    bool isPasswordValid,
    bool isConfirmPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return ForgotPasswordState(
      isUsernameValid: isUsernameValid ?? this.isUsernameValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }
}
