import 'package:flutter/material.dart';

class UpdateInformationState {
  final bool isNameValid;
  final bool isAddressValid;
  final bool isDobValid;
  final bool isTelValid;
  final bool isEmailValid;
  final bool isGenderValid;
  final bool isJobValid;
  final bool isIntroValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  bool get isFormValid => isNameValid && isAddressValid && isDobValid && isTelValid && isEmailValid && isGenderValid&& isJobValid && isIntroValid;

  UpdateInformationState(
      {@required this.isNameValid,
      @required this.isAddressValid,
      @required this.isDobValid,
      @required this.isTelValid,
      @required this.isEmailValid,
      @required this.isGenderValid,
      @required this.isJobValid,
      @required this.isIntroValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.message
      });

  factory UpdateInformationState.empty() {
    return UpdateInformationState(
        isNameValid: true,
        isAddressValid: true,
        isDobValid: true,
        isTelValid: true,
        isEmailValid: true,
        isGenderValid: true,
        isJobValid: true,
        isIntroValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory UpdateInformationState.loading() {
    return UpdateInformationState(
        isNameValid: true,
        isAddressValid: true,
        isDobValid: true,
        isTelValid: true,
        isEmailValid: true,
        isGenderValid: true,
        isJobValid: true,
        isIntroValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory UpdateInformationState.failure({String message}) {
    return UpdateInformationState(
        isNameValid: true,
        isAddressValid: true,
        isDobValid: true,
        isTelValid: true,
        isEmailValid: true,
        isGenderValid: true,
        isJobValid: true,
        isIntroValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message);
  }

  factory UpdateInformationState.success({String message}) {
    return UpdateInformationState(
        isNameValid: true,
        isAddressValid: true,
        isDobValid: true,
        isTelValid: true,
        isEmailValid: true,
        isGenderValid: true,
        isJobValid: true,
        isIntroValid: true,
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        message: message);
  }

  UpdateInformationState update(
      {bool isNameValid,
      bool isAddressValid,
      bool isDobValid,
      bool isTelValid,
      bool isEmailValid,
      bool isGenderValid,
      bool isJobValid,
      bool isIntroValid,
      String message}) {
    return copyWith(
      isNameValid: isNameValid,
      isAddressValid: isAddressValid,
      isDobValid: isDobValid,
      isTelValid: isTelValid,
      isGenderValid: isGenderValid,
      isEmailValid: isEmailValid,
      isJobValid: isJobValid,
      isIntroValid: isIntroValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      message: message,
    );
  }

  UpdateInformationState copyWith({
    bool isNameValid,
    bool isAddressValid,
    bool isDobValid,
    bool isTelValid,
    bool isEmailValid,
    bool isGenderValid,
    bool isJobValid,
    bool isIntroValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    String message,
  }) {
    return UpdateInformationState(
      isNameValid: isNameValid ?? this.isNameValid,
      isAddressValid: isAddressValid ?? this.isAddressValid,
      isDobValid: isDobValid ?? this.isDobValid,
      isTelValid: isTelValid ?? this.isTelValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isGenderValid: isGenderValid ?? this.isGenderValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isJobValid: isJobValid ?? this.isJobValid,
      isIntroValid: isIntroValid ?? this.isIntroValid,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'UpdateInformation State{isNameValid: $isNameValid, isAddressValid: $isAddressValid, isDobValid: $isDobValid, isTelValid: $isTelValid, isEmailValid: $isEmailValid, isGenderValid: $isGenderValid , isJobValid: $isJobValid, isIntroValid: $isIntroValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, message: $message}';
  }
}
