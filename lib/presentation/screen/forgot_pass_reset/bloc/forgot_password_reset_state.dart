import 'package:flutter/cupertino.dart';

class ForgotPasswordResetState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isOTPValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  bool get isFormValid =>
      isEmailValid && isPasswordValid && isOTPValid;

  ForgotPasswordResetState(
      {@required this.isEmailValid,
        @required this.isPasswordValid,
        @required this.isSubmitting,
        @required this.isOTPValid,
        @required this.isSuccess,
        @required this.isFailure,
        @required this.message});

  factory ForgotPasswordResetState.empty() {
    return ForgotPasswordResetState(
        isEmailValid: true,
        isPasswordValid: true,
        isOTPValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ForgotPasswordResetState.loading() {
    return ForgotPasswordResetState(
        isEmailValid: true,
        isPasswordValid: true,
        isOTPValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ForgotPasswordResetState.failure({String message}) {
    return ForgotPasswordResetState(
        isEmailValid: true,
        isPasswordValid: true,
        isOTPValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message);
  }

  factory ForgotPasswordResetState.success({String message}) {
    return ForgotPasswordResetState(
        isEmailValid: true,
        isPasswordValid: true,
        isOTPValid: true,
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        message: message);
  }

  ForgotPasswordResetState update(
      {bool isEmailValid, bool isPasswordValid, bool isOTPValid}) {
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isOTPValid: isOTPValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  ForgotPasswordResetState copyWith({
    bool isEmailValid,
    bool isPasswordValid,
    bool isOTPValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return ForgotPasswordResetState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isOTPValid: isOTPValid ?? this.isOTPValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }
}
