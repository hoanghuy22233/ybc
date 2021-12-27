import 'package:flutter/material.dart';
import 'package:ybc/utils/dio/dio_status.dart';

class AddressFormState {
  final bool isAddressValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  bool get isFormValid => isAddressValid;

  AddressFormState({
    @required this.isAddressValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.status,
  });

  factory AddressFormState.empty() {
    return AddressFormState(
        isAddressValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory AddressFormState.loading() {
    return AddressFormState(
        isAddressValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory AddressFormState.failure({DioStatus status}) {
    return AddressFormState(
        isAddressValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        status: status);
  }

  factory AddressFormState.success({DioStatus status}) {
    return AddressFormState(
        isAddressValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        status: status);
  }

  AddressFormState update({bool isAddressValid, DioStatus status}) {
    return copyWith(
        isAddressValid: isAddressValid,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: status);
  }

  AddressFormState copyWith({
    bool isAddressValid,
    bool isPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return AddressFormState(
      isAddressValid: isPasswordValid ?? this.isAddressValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'AddressFormState{isAddressValid: $isAddressValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
