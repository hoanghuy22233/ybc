import 'package:flutter/material.dart';

class AddCartState {
  final bool isCourseIdValid;
  final bool isApiTokenValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;
  final String token;

  bool get isFormValid => isCourseIdValid && isApiTokenValid;

  AddCartState(
      {@required this.isCourseIdValid,
        @required this.isApiTokenValid,
        @required this.isSubmitting,
        @required this.isSuccess,
        @required this.isFailure,
        @required this.message,
        this.token});

  factory AddCartState.empty() {
    return AddCartState(
        isCourseIdValid: true,
        isApiTokenValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '',
        token: '');
  }

  factory AddCartState.loading() {
    return AddCartState(
        isCourseIdValid: true,
        isApiTokenValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '',
        token: '');
  }

  factory AddCartState.failure({String message}) {
    return AddCartState(
        isCourseIdValid: true,
        isApiTokenValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message,
        token: '');
  }

  factory AddCartState.success({String message, @required String token}) {
    return AddCartState(
        isCourseIdValid: true,
        isApiTokenValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        message: message,
        token: token);
  }

  AddCartState update(
      {bool isCourseIdValid, bool isApiTokenValid, String message}) {
    return copyWith(
        isCourseIdValid: isCourseIdValid,
        isApiTokenValid: isApiTokenValid,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: message);
  }

  AddCartState copyWith({
    bool isCourseIdValid,
    bool isApiTokenValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    String message,
  }) {
    return AddCartState(
      isCourseIdValid: isCourseIdValid ?? this.isCourseIdValid,
      isApiTokenValid: isApiTokenValid ?? this.isApiTokenValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'AddCartState{isCourseIdValid: $isCourseIdValid, isApiTokenValid: $isApiTokenValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, message: $message}';
  }
}
