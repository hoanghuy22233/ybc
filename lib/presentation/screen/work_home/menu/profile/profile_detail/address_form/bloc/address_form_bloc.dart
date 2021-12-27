import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as Get;
import 'package:rxdart/rxdart.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/repo/barrel_repo.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/address_form/bloc/address_form_state.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/phone_form/bloc/phone_form_event.dart';
import 'package:ybc/utils/utils.dart';

import 'address_form_event.dart';

class AddressFormBloc extends Bloc<AddressFormEvent, AddressFormState> {
  final UserRepository _userRepository;

  AddressFormBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  get initialState => AddressFormState.empty();

  @override
  Stream<Transition<AddressFormEvent, AddressFormState>> transformEvents(
      Stream<AddressFormEvent> events, transitionFn) {
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
  Stream<AddressFormState> mapEventToState(AddressFormEvent event) async* {
    if (event is AddressFormSubmitEvent) {
      yield* _mapAddressFormSubmitEventToState(event.address);
    } else if (event is AddressChanged) {
      yield* _mapAddressChangedToState(event.address);
    }
  }

  Stream<AddressFormState> _mapAddressFormSubmitEventToState(
      String address) async* {
    try {
      yield AddressFormState.loading();

      var response = await _userRepository.updateAddress(address: address);
      print('---token----');
      print(response);

      if (response.status == Endpoint.SUCCESS) {
        yield AddressFormState.success(
            status: DioStatus(
                message: response.msg, code: DioStatus.API_SUCCESS_NOTIFY));
        Future.delayed(Duration(milliseconds: 300), () async {
          BlocProvider.of<ProfileBloc>(Get.Get.context).add(LoadProfile());
        });
      } else {
        yield AddressFormState.failure(
            status: DioStatus(
                message: response.msg, code: DioStatus.API_FAILURE_NOTIFY));
      }
    } catch (e) {
      yield AddressFormState.failure(status: DioErrorUtil.handleError(e));
    }
  }

  Stream<AddressFormState> _mapAddressChangedToState(String address) async* {
    yield state.update(isAddressValid: Validator.isValidUsername(address));
  }
}
