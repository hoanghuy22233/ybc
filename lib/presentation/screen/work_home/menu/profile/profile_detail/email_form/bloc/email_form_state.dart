import 'package:flutter/material.dart';
import 'package:ybc/utils/dio/barrel_dio.dart';

class EmailFormState {
  final bool isEmailValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  bool get isFormValid => isEmailValid;

  EmailFormState({
    @required this.isEmailValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.status,
  });

  factory EmailFormState.empty() {
    return EmailFormState(
        isEmailValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory EmailFormState.loading() {
    return EmailFormState(
        isEmailValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory EmailFormState.failure({DioStatus status}) {
    return EmailFormState(
        isEmailValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        status: status);
  }

  factory EmailFormState.success({DioStatus status}) {
    return EmailFormState(
        isEmailValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        status: status);
  }

  EmailFormState update({bool isEmailValid, DioStatus status}) {
    return copyWith(
        isEmailValid: isEmailValid,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: status);
  }

  EmailFormState copyWith({
    bool isEmailValid,
    bool isPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return EmailFormState(
      isEmailValid: isPasswordValid ?? this.isEmailValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'EmailFormState{isEmailValid: $isEmailValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
