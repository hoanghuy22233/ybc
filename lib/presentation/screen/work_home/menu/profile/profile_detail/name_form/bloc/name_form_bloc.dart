import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/repo/barrel_repo.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/name_form/bloc/name_form_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/name_form/bloc/name_form_state.dart';
import 'package:ybc/utils/utils.dart';

class NameFormBloc extends Bloc<NameFormEvent, NameFormState> {
  final UserRepository _userRepository;

  NameFormBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  get initialState => NameFormState.empty();

  @override
  Stream<Transition<NameFormEvent, NameFormState>> transformEvents(
      Stream<NameFormEvent> events, transitionFn) {
    final nonDebounceStream = events.where((event) {
      return (event is! FullnameChanged);
    });

    final debounceStream = events.where((event) {
      return (event is FullnameChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  @override
  Stream<NameFormState> mapEventToState(NameFormEvent event) async* {
    if (event is NameFormSubmitEvent) {
      yield* _mapNameFormSubmitEventToState(event.fullname);
    } else if (event is FullnameChanged) {
      yield* _mapFullnameChangedToState(event.fullname);
    }
  }

  Stream<NameFormState> _mapNameFormSubmitEventToState(String fullname) async* {
    try {
      yield NameFormState.loading();

      var response = await _userRepository.updateName(name: fullname);
      print('---token----');
      print(response);

      if (response.status == Endpoint.SUCCESS) {
        yield NameFormState.success(DioStatus(
            message: response.msg, code: DioStatus.API_SUCCESS_NOTIFY));
      } else {
        yield NameFormState.failure(DioStatus(
            message: response.msg, code: DioStatus.API_FAILURE_NOTIFY));
      }
    } catch (e) {
      yield NameFormState.failure(DioErrorUtil.handleError(e));
    }
  }

  Stream<NameFormState> _mapFullnameChangedToState(String fullname) async* {
    yield state.update(isNameValid: Validator.isValidFullname(fullname));
  }
}
