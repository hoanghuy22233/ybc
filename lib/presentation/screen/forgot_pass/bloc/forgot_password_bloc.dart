import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/utils/validator/validator.dart';

import 'bloc.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final UserRepository _userRepository;

  ForgotPasswordBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  ForgotPasswordState get initialState => ForgotPasswordState.empty();

  @override
  Stream<ForgotPasswordState> mapEventToState(
      ForgotPasswordEvent event) async* {
    if (event is UsernameChanged) {
      yield* _mapUsernameChangedToState(event.email);
    } else if (event is ForgotPasswordSubmitted) {
      yield* _mapFormSubmittedToState(event.email);
    }
  }

  Stream<ForgotPasswordState> _mapUsernameChangedToState(String email) async* {
    yield state.update(
      isUsernameValid: Validator.isValidUsername(email),
    );
  }

  Stream<ForgotPasswordState> _mapFormSubmittedToState(String email) async* {
    yield ForgotPasswordState.loading();

    var isValidUsername = Validator.isValidUsername(email);

    var newState = state.update(
      isUsernameValid: isValidUsername,
    );

    yield newState;

    if (newState.isFormValid) {
      try {
        var response = await _userRepository.forgotPassword(
          email: email,
        );
        if (response.status == true) {
          yield ForgotPasswordState.success(message: response.msg);
        } else {
          yield ForgotPasswordState.failure(message: response.msg);
        }
      } catch (e) {
        print('----- ForgotPassword: $e');
        yield ForgotPasswordState.failure();
      }
    }
  }
}
