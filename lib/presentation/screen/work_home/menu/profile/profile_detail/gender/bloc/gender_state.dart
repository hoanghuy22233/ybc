import 'package:flutter/material.dart';
import 'package:ybc/utils/dio/dio_status.dart';

class GenderState {
  final int superId;
  final DioStatus status;

  bool get isFormValid => superId != null;

  GenderState({
    @required this.superId,
    @required this.status,
  });

  factory GenderState.empty() {
    return GenderState(superId: null, status: null);
  }

  factory GenderState.loading(GenderState state) {
    return GenderState(
        superId: state.superId, status: DioStatus.loadingNotify());
  }

  factory GenderState.failure(GenderState state) {
    return GenderState(superId: state.superId, status: state.status);
  }

  factory GenderState.success(GenderState state) {
    return GenderState(superId: state.superId, status: state.status);
  }

  GenderState update({int superId, DioStatus status}) {
    return copyWith(
      superId: superId,
      status: status,
    );
  }

  GenderState copyWith({int superId, DioStatus status}) {
    return GenderState(
      superId: superId ?? this.superId,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'GenderState{superId: $superId, status: $status}';
  }
}
