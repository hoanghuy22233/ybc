import 'package:flutter/material.dart';
import 'package:ybc/utils/dio/barrel_dio.dart';

class BirthdayFormState {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  bool get isFormValid => true;

  BirthdayFormState({
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.status,
  });

  factory BirthdayFormState.empty() {
    return BirthdayFormState(
        isSubmitting: false, isSuccess: false, isFailure: false, status: null);
  }

  factory BirthdayFormState.loading() {
    return BirthdayFormState(
        isSubmitting: true, isSuccess: false, isFailure: false, status: null);
  }

  factory BirthdayFormState.failure({DioStatus status}) {
    return BirthdayFormState(
        isSuccess: false, isSubmitting: false, isFailure: true, status: status);
  }

  factory BirthdayFormState.success({DioStatus status}) {
    return BirthdayFormState(
        isSubmitting: false, isSuccess: true, isFailure: false, status: status);
  }

  BirthdayFormState update({DioStatus status}) {
    return copyWith(
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: status);
  }

  BirthdayFormState copyWith({
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return BirthdayFormState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'BirthdayFormState{isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
