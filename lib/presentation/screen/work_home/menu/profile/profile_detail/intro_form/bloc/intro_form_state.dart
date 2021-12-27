import 'package:flutter/material.dart';
import 'package:ybc/utils/dio/barrel_dio.dart';

class IntroFormState {
  final bool isIntroValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  bool get isFormValid => isIntroValid;

  IntroFormState({
    @required this.isIntroValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.status,
  });

  factory IntroFormState.empty() {
    return IntroFormState(
        isIntroValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory IntroFormState.loading() {
    return IntroFormState(
        isIntroValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory IntroFormState.failure({DioStatus status}) {
    return IntroFormState(
        isIntroValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        status: status);
  }

  factory IntroFormState.success({DioStatus status}) {
    return IntroFormState(
        isIntroValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        status: status);
  }

  IntroFormState update({bool isIntroValid, DioStatus status}) {
    return copyWith(
        isIntroValid: isIntroValid,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: status);
  }

  IntroFormState copyWith({
    bool isIntroValid,
    bool isPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return IntroFormState(
      isIntroValid: isPasswordValid ?? this.isIntroValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'IntroFormState{isInfoValid: $isIntroValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
