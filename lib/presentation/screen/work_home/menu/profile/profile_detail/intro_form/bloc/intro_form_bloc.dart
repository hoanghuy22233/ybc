import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as Get;
import 'package:rxdart/rxdart.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/repo/barrel_repo.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/bloc.dart';
import 'package:ybc/utils/utils.dart';

import 'bloc.dart';


class IntroFormBloc extends Bloc<IntroFormEvent, IntroFormState> {
  final UserRepository _userRepository;

  IntroFormBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  get initialState => IntroFormState.empty();

  @override
  Stream<Transition<IntroFormEvent, IntroFormState>> transformEvents(
      Stream<IntroFormEvent> events, transitionFn) {
    final nonDebounceStream = events.where((event) {
      return (event is! IntroChanged);
    });

    final debounceStream = events.where((event) {
      return (event is IntroChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  @override
  Stream<IntroFormState> mapEventToState(IntroFormEvent event) async* {
    if (event is IntroFormSubmitEvent) {
      yield* _mapIntroFormSubmitEventToState(event.intro);
    } else if (event is IntroChanged) {
      yield* _mapIntroChangedToState(event.intro);
    }
  }

  Stream<IntroFormState> _mapIntroFormSubmitEventToState(String intro) async* {
    try {
      yield IntroFormState.loading();

      var response = await _userRepository.updateIntro(intro: intro);
      print('---token----');
      print(response);

      if (response.status == Endpoint.SUCCESS) {
        yield IntroFormState.success(
            status: DioStatus(
                message: response.msg, code: DioStatus.API_SUCCESS_NOTIFY));
        Future.delayed(Duration(milliseconds: 300), () async {
          BlocProvider.of<ProfileBloc>(Get.Get.context).add(LoadProfile());
        });
      } else {
        yield IntroFormState.failure(
            status: DioStatus(
                message: response.msg, code: DioStatus.API_FAILURE_NOTIFY));
      }
    } catch (e) {
      yield IntroFormState.failure(status: DioErrorUtil.handleError(e));
    }
  }

  Stream<IntroFormState> _mapIntroChangedToState(String name) async* {
    yield state.update(isIntroValid: Validator.isValidFullname(name));
  }
}
