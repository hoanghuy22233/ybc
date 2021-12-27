import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as Get;
import 'package:rxdart/rxdart.dart';
import 'package:ybc/app/constants/endpoint/app_endpoint.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/bloc.dart';
import 'package:ybc/utils/dio/dio_error_util.dart';
import 'package:ybc/utils/dio/dio_status.dart';
import 'package:ybc/utils/validator/validator.dart';

import 'bloc.dart';


class CareerFormBloc extends Bloc<CareerFormEvent, CareerFormState> {
  final UserRepository _userRepository;

  CareerFormBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  get initialState => CareerFormState.empty();

  @override
  Stream<Transition<CareerFormEvent, CareerFormState>> transformEvents(
      Stream<CareerFormEvent> events, transitionFn) {
    final nonDebounceStream = events.where((event) {
      return (event is! CareerChanged);
    });

    final debounceStream = events.where((event) {
      return (event is CareerChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  @override
  Stream<CareerFormState> mapEventToState(CareerFormEvent event) async* {
    if (event is CareerFormSubmitEvent) {
      yield* _mapCareerFormSubmitEventToState(event.career);
    } else if (event is CareerChanged) {
      yield* _mapCareerChangedToState(event.career);
    }
  }

  Stream<CareerFormState> _mapCareerFormSubmitEventToState(
      String career) async* {
    try {
      yield CareerFormState.loading();

      var response = await _userRepository.updateJob(job: career);
      print('---token----');
      print(response);

      if (response.status == Endpoint.SUCCESS) {
        yield CareerFormState.success(
            status: DioStatus(
                message: response.msg, code: DioStatus.API_SUCCESS_NOTIFY));
        Future.delayed(Duration(milliseconds: 300), () async {
          BlocProvider.of<ProfileBloc>(Get.Get.context).add(LoadProfile());
        });
      } else {
        yield CareerFormState.failure(
            status: DioStatus(
                message: response.msg, code: DioStatus.API_FAILURE_NOTIFY));
      }
    } catch (e) {
      yield CareerFormState.failure(status: DioErrorUtil.handleError(e));
    }
  }

  Stream<CareerFormState> _mapCareerChangedToState(String career) async* {
    yield state.update(isCareerValid: Validator.isValidFullname(career));
  }
}
