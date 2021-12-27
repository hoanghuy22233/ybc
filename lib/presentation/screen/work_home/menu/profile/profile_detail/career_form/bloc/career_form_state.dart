import 'package:flutter/material.dart';
import 'package:ybc/utils/dio/dio_status.dart';

class CareerFormState {
  final bool isCareerValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  bool get isFormValid => isCareerValid;

  CareerFormState({
    @required this.isCareerValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.status,
  });

  factory CareerFormState.empty() {
    return CareerFormState(
        isCareerValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory CareerFormState.loading() {
    return CareerFormState(
        isCareerValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory CareerFormState.failure({DioStatus status}) {
    return CareerFormState(
        isCareerValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        status: status);
  }

  factory CareerFormState.success({DioStatus status}) {
    return CareerFormState(
        isCareerValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        status: status);
  }

  CareerFormState update({bool isCareerValid, DioStatus status}) {
    return copyWith(
        isCareerValid: isCareerValid,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: status);
  }

  CareerFormState copyWith({
    bool isCareerValid,
    bool isPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return CareerFormState(
      isCareerValid: isPasswordValid ?? this.isCareerValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'CareerFormState{isCareerValid: $isCareerValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
