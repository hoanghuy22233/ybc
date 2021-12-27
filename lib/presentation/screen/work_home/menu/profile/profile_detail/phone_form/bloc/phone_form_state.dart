import 'package:flutter/material.dart';
import 'package:ybc/utils/dio/dio_status.dart';

class PhoneFormState {
  final bool isPhoneValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  bool get isFormValid => isPhoneValid;

  PhoneFormState({
    @required this.isPhoneValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.status,
  });

  factory PhoneFormState.empty() {
    return PhoneFormState(
        isPhoneValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory PhoneFormState.loading() {
    return PhoneFormState(
        isPhoneValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory PhoneFormState.failure({DioStatus status}) {
    return PhoneFormState(
        isPhoneValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        status: status);
  }

  factory PhoneFormState.success({DioStatus status}) {
    return PhoneFormState(
        isPhoneValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        status: status);
  }

  PhoneFormState update({bool isPhoneValid, DioStatus status}) {
    return copyWith(
        isPhoneValid: isPhoneValid,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: status);
  }

  PhoneFormState copyWith({
    bool isPhoneValid,
    bool isPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return PhoneFormState(
      isPhoneValid: isPasswordValid ?? this.isPhoneValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'PhoneFormState{isPhoneValid: $isPhoneValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
