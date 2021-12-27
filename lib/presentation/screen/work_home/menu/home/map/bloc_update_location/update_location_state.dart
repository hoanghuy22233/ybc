import 'package:flutter/cupertino.dart';

class UpdateLocationState {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;


  UpdateLocationState(
      {
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.message});

  factory UpdateLocationState.empty() {
    return UpdateLocationState(
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory UpdateLocationState.loading() {
    return UpdateLocationState(
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory UpdateLocationState.failure({String message}) {
    return UpdateLocationState(
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message);
  }

  factory UpdateLocationState.success({String message}) {
    return UpdateLocationState(
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        message: message);
  }

  UpdateLocationState update() {
    return copyWith(
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  UpdateLocationState copyWith({
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return UpdateLocationState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }
}
