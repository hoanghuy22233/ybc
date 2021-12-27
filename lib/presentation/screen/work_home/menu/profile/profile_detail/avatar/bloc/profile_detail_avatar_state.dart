import 'package:flutter/material.dart';
import 'package:ybc/utils/dio/dio_status.dart';

class ProfileDetailAvatarState {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  bool get isValid => true;

  ProfileDetailAvatarState({
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.status,
  });

  factory ProfileDetailAvatarState.empty() {
    return ProfileDetailAvatarState(
        isSubmitting: false, isSuccess: false, isFailure: false, status: null);
  }

  factory ProfileDetailAvatarState.loading() {
    return ProfileDetailAvatarState(
        isSubmitting: true, isSuccess: false, isFailure: false, status: null);
  }

  factory ProfileDetailAvatarState.failure({DioStatus status}) {
    return ProfileDetailAvatarState(
        isSuccess: false, isSubmitting: false, isFailure: true, status: status);
  }

  factory ProfileDetailAvatarState.success({DioStatus status}) {
    return ProfileDetailAvatarState(
        isSubmitting: false, isSuccess: true, isFailure: false, status: status);
  }

  ProfileDetailAvatarState update({DioStatus status}) {
    return copyWith(
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: status);
  }

  ProfileDetailAvatarState copyWith({
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return ProfileDetailAvatarState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'ProfileDetailAvatarState{isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
