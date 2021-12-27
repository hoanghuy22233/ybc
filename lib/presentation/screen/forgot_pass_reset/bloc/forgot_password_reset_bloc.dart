import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/utils/validator/validator.dart';

import 'bloc.dart';

class ForgotPasswordResetBloc
    extends Bloc<ForgotPasswordResetEvent, ForgotPasswordResetState> {
  final UserRepository _userRepository;

  ForgotPasswordResetBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  ForgotPasswordResetState get initialState => ForgotPasswordResetState.empty();

  @override
  Stream<ForgotPasswordResetState> mapEventToState(
      ForgotPasswordResetEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapUsernameChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is OtpCodeChanged) {
      yield* _mapOtpCodeChangedToState(event.otpCode);
    } else if (event is ForgotPasswordResetSubmitted) {
      yield* _mapFormSubmittedToState(event.email, event.password, event.otpCode);
    }
  }

  Stream<ForgotPasswordResetState> _mapUsernameChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validator.isValidEmail(email),
    );
  }

  Stream<ForgotPasswordResetState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validator.isValidPassword(password),
    );
  }

  Stream<ForgotPasswordResetState> _mapOtpCodeChangedToState(String otpCode) async* {
    yield state.update(
      isOTPValid: Validator.isValidOtp(otpCode),
    );
  }

  Stream<ForgotPasswordResetState> _mapFormSubmittedToState(String email, String password, String otpCode) async* {
    try {
      yield ForgotPasswordResetState.loading();

      var response = await _userRepository.forgotPasswordReset(
          email: email, password: password, codeChangePassword: otpCode);

      if (response.status == true) {
        yield ForgotPasswordResetState.success(
            message: response.msg);
      } else {
        yield ForgotPasswordResetState.failure(message: response.msg);
      }
    } catch (e) {
      yield ForgotPasswordResetState.failure(message: e.toString());
    }
  }
}
