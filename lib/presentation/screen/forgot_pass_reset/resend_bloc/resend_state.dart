import 'package:flutter/cupertino.dart';

class ResendOTPState {
  final int time;
  final bool isTimeValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  bool get isFormValid => isTimeValid && time == 0;

  ResendOTPState(
      {@required this.time,
        @required this.isTimeValid,
        @required this.isSubmitting,
        @required this.isSuccess,
        @required this.isFailure,
        @required this.message});

  factory ResendOTPState.empty() {
    return ResendOTPState(
        time: null,
        isTimeValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ResendOTPState.loading() {
    return ResendOTPState(
        time: 0,
        isTimeValid: false,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ResendOTPState.failure({String message}) {
    return ResendOTPState(
        time: 0,
        isTimeValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message);
  }

  factory ResendOTPState.success({String message}) {
    return ResendOTPState(
        time: 0,
        isTimeValid: false,
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        message: message);
  }

  ResendOTPState update({
    @required int time,
    bool isTimeValid,
  }) {
    return copyWith(
      time: time,
      isTimeValid: isTimeValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  ResendOTPState copyWith({
    @required int time,
    bool isTimeValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return ResendOTPState(
      time: time,
      isTimeValid: isTimeValid ?? this.isTimeValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }
}
