import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as Get;
import 'package:rxdart/rxdart.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/repo/barrel_repo.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/phone_form/bloc/phone_form_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/phone_form/bloc/phone_form_state.dart';
import 'package:ybc/utils/utils.dart';

class PhoneFormBloc extends Bloc<PhoneFormEvent, PhoneFormState> {
  final UserRepository _userRepository;

  PhoneFormBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  get initialState => PhoneFormState.empty();

  @override
  Stream<Transition<PhoneFormEvent, PhoneFormState>> transformEvents(
      Stream<PhoneFormEvent> events, transitionFn) {
    final nonDebounceStream = events.where((event) {
      return (event is! PhoneChanged);
    });

    final debounceStream = events.where((event) {
      return (event is PhoneChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  @override
  Stream<PhoneFormState> mapEventToState(PhoneFormEvent event) async* {
    if (event is PhoneFormSubmitEvent) {
      yield* _mapPhoneFormSubmitEventToState(event.phone);
    } else if (event is PhoneChanged) {
      yield* _mapPhoneChangedToState(event.phone);
    }
  }

  Stream<PhoneFormState> _mapPhoneFormSubmitEventToState(String phone) async* {
    try {
      yield PhoneFormState.loading();

      var response = await _userRepository.updatePhone(phone: phone);
      print('---token----');
      print(response);

      if (response.status == Endpoint.SUCCESS) {
        yield PhoneFormState.success(
            status: DioStatus(
                message: response.msg, code: DioStatus.API_SUCCESS_NOTIFY));
        Future.delayed(Duration(milliseconds: 300), () async {
          BlocProvider.of<ProfileBloc>(Get.Get.context).add(LoadProfile());
        });
      } else {
        yield PhoneFormState.failure(
            status: DioStatus(
                message: response.msg, code: DioStatus.API_FAILURE_NOTIFY));
      }
    } catch (e) {
      yield PhoneFormState.failure(status: DioErrorUtil.handleError(e));
    }
  }

  Stream<PhoneFormState> _mapPhoneChangedToState(String phone) async* {
    yield state.update(isPhoneValid: Validator.isValidUsername(phone));
  }
}
