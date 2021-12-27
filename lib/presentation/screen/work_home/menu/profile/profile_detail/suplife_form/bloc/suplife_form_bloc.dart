import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as Get;
import 'package:rxdart/rxdart.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/repo/barrel_repo.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/suplife_form/bloc/suplife_form_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/suplife_form/bloc/suplife_form_state.dart';
import 'package:ybc/utils/utils.dart';

class SuplifeFormBloc extends Bloc<SuplifeFormEvent, SuplifeFormState> {
  final UserRepository _userRepository;

  SuplifeFormBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  get initialState => SuplifeFormState.empty();

  @override
  Stream<Transition<SuplifeFormEvent, SuplifeFormState>> transformEvents(
      Stream<SuplifeFormEvent> events, transitionFn) {
    final nonDebounceStream = events.where((event) {
      return (event is! SuplifeChanged);
    });

    final debounceStream = events.where((event) {
      return (event is SuplifeChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  @override
  Stream<SuplifeFormState> mapEventToState(SuplifeFormEvent event) async* {
    if (event is SuplifeFormSubmitEvent) {
      yield* _mapSuplifeFormSubmitEventToState(event.suplife);
    } else if (event is SuplifeChanged) {
      yield* _mapSuplifeChangedToState(event.suplife);
    }
  }

  Stream<SuplifeFormState> _mapSuplifeFormSubmitEventToState(
      String suplife) async* {
    try {
      yield SuplifeFormState.loading();

      var response = await _userRepository.updateSuplife(suplife: suplife);
      print('---token----');
      print(response);

      if (response.status == Endpoint.SUCCESS) {
        yield SuplifeFormState.success(
            status: DioStatus(
                message: response.msg, code: DioStatus.API_SUCCESS_NOTIFY));
        Future.delayed(Duration(milliseconds: 300), () async {
          BlocProvider.of<ProfileBloc>(Get.Get.context).add(LoadProfile());
        });
      } else {
        yield SuplifeFormState.failure(
            status: DioStatus(
                message: response.msg, code: DioStatus.API_FAILURE_NOTIFY));
      }
    } catch (e) {
      yield SuplifeFormState.failure(status: DioErrorUtil.handleError(e));
    }
  }

  Stream<SuplifeFormState> _mapSuplifeChangedToState(String name) async* {
    yield state.update(isSuplifeValid: Validator.isValidFullname(name));
  }
}
