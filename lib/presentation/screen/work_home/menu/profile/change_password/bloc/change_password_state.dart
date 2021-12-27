import 'package:flutter/cupertino.dart';

class ChangePasswordState {
  final bool isOldPasswordValid;
  final bool isNewPasswordValid;
  final bool isConfirmNewPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  bool get isFormValid =>
      isOldPasswordValid && isNewPasswordValid && isConfirmNewPasswordValid;

  ChangePasswordState(
      {@required this.isOldPasswordValid,
        @required this.isNewPasswordValid,
        @required this.isConfirmNewPasswordValid,
        @required this.isSubmitting,
        @required this.isSuccess,
        @required this.isFailure,
        @required this.message});

  factory ChangePasswordState.empty() {
    return ChangePasswordState(
        isOldPasswordValid: true,
        isNewPasswordValid: true,
        isConfirmNewPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ChangePasswordState.loading() {
    return ChangePasswordState(
        isOldPasswordValid: true,
        isNewPasswordValid: true,
        isConfirmNewPasswordValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ChangePasswordState.failure({String message}) {
    return ChangePasswordState(
        isOldPasswordValid: true,
        isNewPasswordValid: true,
        isConfirmNewPasswordValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message);
  }

  factory ChangePasswordState.success({String message}) {
    return ChangePasswordState(
        isOldPasswordValid: true,
        isNewPasswordValid: true,
        isConfirmNewPasswordValid: true,
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        message: message);
  }

  ChangePasswordState update(
      {bool isOldPasswordValid, bool isNewPasswordValid, bool isConfirmNewPasswordValid}) {
    return copyWith(
      isOldPasswordValid: isOldPasswordValid,
      isNewPasswordValid: isNewPasswordValid,
      isConfirmNewPasswordValid: isConfirmNewPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  ChangePasswordState copyWith({
    bool isOldPasswordValid,
    bool isNewPasswordValid,
    bool isConfirmNewPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return ChangePasswordState(
      isOldPasswordValid: isOldPasswordValid ?? this.isOldPasswordValid,
      isNewPasswordValid: isNewPasswordValid ?? this.isNewPasswordValid,
      isConfirmNewPasswordValid: isConfirmNewPasswordValid ?? this.isConfirmNewPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }
}
