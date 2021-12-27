import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ybc/app/constants/endpoint/app_endpoint.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/utils/validator/validator.dart';

import 'bloc.dart';

class UpdateInformationBloc extends Bloc<UpdateInformationEvent, UpdateInformationState> {
  final UserRepository _userRepository;

  UpdateInformationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  get initialState => UpdateInformationState.empty();

  @override
  Stream<UpdateInformationState> mapEventToState(UpdateInformationEvent event) async* {
    if (event is NameChanged) {
      yield* _mapNameChangedToState(event.name);
    } else if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is TelChanged) {
      yield* _mapTelChangedToState(event.tel);
    } else if (event is AddressChanged) {
      yield* _mapAddressChangedToState(event.address);
    } else if (event is DobChanged) {
      yield* _mapDobChangedToState(event.dob);
    } else if (event is JobChanged) {
      yield* _mapJobChangedToState(event.job);
    } else if (event is IntroChanged) {
      yield* _mapIntroChangedToState(event.intro);
    } else if (event is GenderChanged) {
      yield* _mapGenderChangedToState(event.gender);
    } else if (event is UpdateInformationSubmitted) {
      yield* _mapFormSubmittedToState(
          event.name, event.address, event.dob, event.email, event.tel,event.job, event.intro, event.gender);
    }
  }

  Stream<UpdateInformationState> _mapNameChangedToState(String name) async* {
    yield state.update(
      isNameValid: Validator.isValidFullname(name),
    );
  }

  Stream<UpdateInformationState> _mapAddressChangedToState(String address) async* {
    yield state.update(
      isAddressValid: Validator.isValidName(address),
    );
  }

  Stream<UpdateInformationState> _mapDobChangedToState(String dob) async* {
    yield state.update(
      isDobValid: Validator.isValidDob(dob),
    );
  }

  Stream<UpdateInformationState> _mapTelChangedToState(String tel) async* {
    yield state.update(
      isTelValid: Validator.isValidTel(tel),
    );
  }

  Stream<UpdateInformationState> _mapGenderChangedToState(String gender) async* {
    yield state.update(
      isGenderValid: Validator.isValidNumber(gender),
    );
  }

  Stream<UpdateInformationState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validator.isValidEmail(email),
    );
  }

  Stream<UpdateInformationState> _mapJobChangedToState(String job) async* {
    yield state.update(
      isJobValid: Validator.isValidName(job),
    );
  }

  Stream<UpdateInformationState> _mapIntroChangedToState(String intro) async* {
    yield state.update(
      isIntroValid: Validator.isValidName(intro),
    );
  }


  Stream<UpdateInformationState> _mapFormSubmittedToState(
      String name, String address, String dob, String email, String tel, String job, String intro, int gender) async* {
    try {
      yield UpdateInformationState.loading();
      var response = await _userRepository.updateInformation(
        name: name,
        email: email,
        address: address,
        tel: tel,
        dob: dob,
        job: job,
        intro: intro,
        gender: gender
    );
      if (response.status == true){
        yield UpdateInformationState.success(message: response.msg);
      } else {
        yield UpdateInformationState.failure(message: response.msg);
      }
    } catch (e) {
      print("------ UpdateInformation: $e");
      yield UpdateInformationState.failure();
    }

  }

}
