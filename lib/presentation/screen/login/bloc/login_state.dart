import 'package:flutter/material.dart';

class LoginState {
  final bool isUsernameValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;
  final String token;

  bool get isFormValid => isUsernameValid && isPasswordValid;

  LoginState(
      {@required this.isUsernameValid,
      @required this.isPasswordValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.message,
      this.token});

  factory LoginState.empty() {
    return LoginState(
        isUsernameValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '',
        token: '');
  }

  factory LoginState.loading() {
    return LoginState(
        isUsernameValid: true,
        isPasswordValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '',
        token: '');
  }

  factory LoginState.failure({String message}) {
    return LoginState(
        isUsernameValid: true,
        isPasswordValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message,
        token: '');
  }

  factory LoginState.success({String message, @required String token}) {
    return LoginState(
        isUsernameValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        message: message,
        token: token);
  }

  LoginState update(
      {bool isUsernameValid, bool isPasswordValid, String message}) {
    return copyWith(
        isUsernameValid: isUsernameValid,
        isPasswordValid: isPasswordValid,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: message);
  }

  LoginState copyWith({
    bool isUsernameValid,
    bool isPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    String message,
  }) {
    return LoginState(
      isUsernameValid: isUsernameValid ?? this.isUsernameValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'LoginState{isUsernameValid: $isUsernameValid, isPasswordValid: $isPasswordValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, message: $message}';
  }
}
