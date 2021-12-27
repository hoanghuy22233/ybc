import 'package:flutter/material.dart';
import 'package:ybc/utils/dio/barrel_dio.dart';

class SuplifeFormState {
  final bool isSuplifeValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  bool get isFormValid => isSuplifeValid;

  SuplifeFormState({
    @required this.isSuplifeValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.status,
  });

  factory SuplifeFormState.empty() {
    return SuplifeFormState(
        isSuplifeValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory SuplifeFormState.loading() {
    return SuplifeFormState(
        isSuplifeValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory SuplifeFormState.failure({DioStatus status}) {
    return SuplifeFormState(
        isSuplifeValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        status: status);
  }

  factory SuplifeFormState.success({DioStatus status}) {
    return SuplifeFormState(
        isSuplifeValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        status: status);
  }

  SuplifeFormState update({bool isSuplifeValid, DioStatus status}) {
    return copyWith(
        isSuplifeValid: isSuplifeValid,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: status);
  }

  SuplifeFormState copyWith({
    bool isSuplifeValid,
    bool isPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return SuplifeFormState(
      isSuplifeValid: isPasswordValid ?? this.isSuplifeValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'ESuplifeFormState{isEmailValid: $isSuplifeValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
