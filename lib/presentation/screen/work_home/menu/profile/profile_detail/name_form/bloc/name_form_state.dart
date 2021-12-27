import 'package:flutter/material.dart';
import 'package:ybc/utils/dio/barrel_dio.dart';

class NameFormState {
  final bool isNameValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  bool get isFormValid => isNameValid;

  NameFormState({
    @required this.isNameValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.status,
  });

  factory NameFormState.empty() {
    return NameFormState(
        isNameValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory NameFormState.loading() {
    return NameFormState(
        isNameValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory NameFormState.failure(DioStatus status) {
    return NameFormState(
        isNameValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        status: status);
  }

  factory NameFormState.success(DioStatus status) {
    return NameFormState(
        isNameValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        status: status);
  }

  NameFormState update({bool isNameValid, DioStatus status}) {
    return copyWith(
        isNameValid: isNameValid,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: status);
  }

  NameFormState copyWith({
    bool isNameValid,
    bool isPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return NameFormState(
      isNameValid: isPasswordValid ?? this.isNameValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'NameFormState{isNameValid: $isNameValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
