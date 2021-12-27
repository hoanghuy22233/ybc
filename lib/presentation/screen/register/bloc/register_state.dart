import 'package:flutter/material.dart';

class RegisterState {
  final bool isNameValid;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;
  final bool isTelValid;
  final bool isEmailValid;
  final bool isTypeValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  bool get isFormValid => isNameValid && isPasswordValid && isConfirmPasswordValid && isTelValid && isEmailValid && isTypeValid;

  RegisterState(
      {@required this.isNameValid,
      @required this.isPasswordValid,
      @required this.isConfirmPasswordValid,
      @required this.isTelValid,
      @required this.isEmailValid,
      @required this.isTypeValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.message});

  factory RegisterState.empty() {
    return RegisterState(
        isNameValid: true,
        isPasswordValid: true,
        isConfirmPasswordValid: true,
        isTelValid: true,
        isEmailValid: true,
        isTypeValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory RegisterState.loading() {
    return RegisterState(
        isNameValid: true,
        isPasswordValid: true,
        isConfirmPasswordValid: true,
        isTelValid: true,
        isEmailValid: true,
        isTypeValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory RegisterState.failure({String message}) {
    return RegisterState(
        isNameValid: true,
        isPasswordValid: true,
        isConfirmPasswordValid: true,
        isTelValid: true,
        isEmailValid: true,
        isTypeValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message);
  }

  factory RegisterState.success({String message}) {
    return RegisterState(
        isNameValid: true,
        isPasswordValid: true,
        isConfirmPasswordValid: true,
        isTelValid: true,
        isEmailValid: true,
        isTypeValid: true,
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        message: message);
  }

  RegisterState update(
      {bool isNameValid,
      bool isPasswordValid,
      bool isConfirmPasswordValid,
      bool isTelValid,
      bool isEmailValid,
      bool isTypeValid,
      String message}) {
    return copyWith(
      isNameValid: isNameValid,
      isPasswordValid: isPasswordValid,
      isConfirmPasswordValid: isConfirmPasswordValid,
      isTelValid: isTelValid,
      isTypeValid: isTypeValid,
      isEmailValid: isEmailValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      message: message,
    );
  }

  RegisterState copyWith({
    bool isNameValid,
    bool isPasswordValid,
    bool isConfirmPasswordValid,
    bool isTelValid,
    bool isEmailValid,
    bool isTypeValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    String message,
  }) {
    return RegisterState(
      isNameValid: isNameValid ?? this.isNameValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isConfirmPasswordValid: isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      isTelValid: isTelValid ?? this.isTelValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isTypeValid: isTypeValid ?? this.isTypeValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'Register State{isNameValid: $isNameValid, isPasswordValid: $isPasswordValid, isRePasswordValid: $isConfirmPasswordValid, isTelValid: $isTelValid, isEmailValid: $isEmailValid, isTypeValid: $isTypeValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, message: $message}';
  }
}
