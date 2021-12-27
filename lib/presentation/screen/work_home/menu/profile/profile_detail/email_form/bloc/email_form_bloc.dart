import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as Get;
import 'package:rxdart/rxdart.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/repo/barrel_repo.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_event.dart';
import 'package:ybc/utils/utils.dart';

import 'email_form_event.dart';
import 'email_form_state.dart';

class EmailFormBloc extends Bloc<EmailFormEvent, EmailFormState> {
  final UserRepository _userRepository;

  EmailFormBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  get initialState => EmailFormState.empty();

  @override
  Stream<Transition<EmailFormEvent, EmailFormState>> transformEvents(
      Stream<EmailFormEvent> events, transitionFn) {
    final nonDebounceStream = events.where((event) {
      return (event is! EmailChanged);
    });

    final debounceStream = events.where((event) {
      return (event is EmailChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  @override
  Stream<EmailFormState> mapEventToState(EmailFormEvent event) async* {
    if (event is EmailFormSubmitEvent) {
      yield* _mapEmailFormSubmitEventToState(event.email);
    } else if (event is EmailChanged) {
      yield* _mapFullnameChangedToState(event.email);
    }
  }

  Stream<EmailFormState> _mapEmailFormSubmitEventToState(String email) async* {
    try {
      yield EmailFormState.loading();

      var response = await _userRepository.updateEmail(email: email);
      print('---token----');
      print(response);

      if (response.status == Endpoint.SUCCESS) {
        yield EmailFormState.success(
            status: DioStatus(
                message: response.msg, code: DioStatus.API_SUCCESS_NOTIFY));
        Future.delayed(Duration(milliseconds: 300), () async {
          BlocProvider.of<ProfileBloc>(Get.Get.context).add(LoadProfile());
        });
      } else {
        yield EmailFormState.failure(
            status: DioStatus(
                message: response.msg, code: DioStatus.API_FAILURE_NOTIFY));
      }
    } catch (e) {
      yield EmailFormState.failure(status: DioErrorUtil.handleError(e));
    }
  }

  Stream<EmailFormState> _mapFullnameChangedToState(String name) async* {
    yield state.update(isEmailValid: Validator.isValidFullname(name));
  }
}
