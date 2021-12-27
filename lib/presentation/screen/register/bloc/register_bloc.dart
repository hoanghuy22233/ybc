import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ybc/app/constants/endpoint/app_endpoint.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/utils/validator/validator.dart';

import 'bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  get initialState => RegisterState.empty();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is NameChanged) {
      yield* _mapNameChangedToState(event.name);
    } else if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is TelChanged) {
      yield* _mapTelChangedToState(event.tel);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is RePasswordChanged) {
      yield* _mapRePasswordChangedToState(event.password, event.rePassword);
    } else if (event is TypeChanged) {
      yield* _mapTypeChangedToState(event.type);
    } else if (event is RegisterSubmitted) {
      yield* _mapFormSubmittedToState(
          event.name, event.password, event.rePassword, event.email, event.tel, event.type);
    }
  }

  Stream<RegisterState> _mapNameChangedToState(String name) async* {
    yield state.update(
      isNameValid: Validator.isValidFullname(name),
    );
  }

  Stream<RegisterState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validator.isValidPassword(password),
    );
  }

  Stream<RegisterState> _mapRePasswordChangedToState(
      String password, String rePassword) async* {
    var isConfirmPasswordValid = Validator.isValidPassword(rePassword);
    var isMatched = true;

    if (password.isNotEmpty) {
      isMatched = password == rePassword;
    }

    yield state.update(
      isConfirmPasswordValid: isConfirmPasswordValid && isMatched,
    );
  }

  Stream<RegisterState> _mapTelChangedToState(String tel) async* {
    yield state.update(
      isTelValid: Validator.isValidTel(tel),
    );
  }

  Stream<RegisterState> _mapTypeChangedToState(int type) async* {
    yield state.update(
      isTypeValid: Validator.isValidNumber(type.toString()),
    );
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validator.isValidEmail(email),
    );
  }

  Stream<RegisterState> _mapFormSubmittedToState(
      String name, String password, String rePassword, String email, String tel, int type) async* {
    try {
      yield RegisterState.loading();
      var response = await _userRepository.registerApp(
          name: name,
          email: email,
          password: password,
          tel: tel
      );
      if (response.status == true){
        yield RegisterState.success(message: response.msg);
      } else {
        yield RegisterState.failure(message: response.msg);
      }
    } catch (e) {
      print("------ Register: $e");
      yield RegisterState.failure();
    }

  }
}
