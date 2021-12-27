import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/endpoint/app_endpoint.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/utils/dio/dio_error_util.dart';
import 'package:ybc/utils/dio/dio_status.dart';

import 'gender_event.dart';
import 'gender_state.dart';

class GenderBloc extends Bloc<GenderEvent, GenderState> {
  final UserRepository _userRepository;

  GenderBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  get initialState => GenderState.empty();

  @override
  Stream<GenderState> mapEventToState(GenderEvent event) async* {
    if (event is GenderSubmitted) {
      yield* _mapGenderSubmittedToState(event.superId);
    }
  }

  Stream<GenderState> _mapGenderSubmittedToState(int superId) async* {
    try {
      yield GenderState.loading(state);
      var response = await _userRepository.genDer(superId: superId);

      if (response.status == Endpoint.SUCCESS) {
        yield GenderState.success(state.update(
            status: DioStatus(
                message: response.msg, code: DioStatus.API_SUCCESS)));
      } else {
        yield GenderState.failure(state.update(
            status: DioStatus(
                message: response.msg,
                code: DioStatus.API_FAILURE_NOTIFY)));
      }
    } catch (e) {
      yield GenderState.failure(
          state.update(status: DioErrorUtil.handleError(e)));
    }
  }
}
