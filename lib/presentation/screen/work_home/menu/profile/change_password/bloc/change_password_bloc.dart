import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ybc/app/constants/preferences/app_preferences.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/utils/validator/validator.dart';

import 'bloc.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final UserRepository _userRepository;

  ChangePasswordBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  ChangePasswordState get initialState => ChangePasswordState.empty();

  @override
  Stream<ChangePasswordState> mapEventToState(
      ChangePasswordEvent event) async* {
    if (event is OldPasswordChanged) {
      yield* _mapPasswordChangedToState(event.oldPassword);
    } else if (event is NewPasswordChanged) {
      yield* _mapOtpCodeChangedToState(event.newPassword);
    } else if (event is ConfirmNewPasswordChanged) {
      yield* _mapConfirmPasswordChangedToState(event.confirmNewPassword);
    } else if (event is ChangePasswordSubmitted) {
      yield* _mapFormSubmittedToState(event.oldPassword, event.newPassword);
    }
  }

  Stream<ChangePasswordState> _mapPasswordChangedToState(String oldPassword) async* {
    yield state.update(
      isOldPasswordValid: Validator.isValidPassword(oldPassword),
    );
  }

  Stream<ChangePasswordState> _mapOtpCodeChangedToState(String newPassword) async* {
    yield state.update(
      isNewPasswordValid: Validator.isValidPassword(newPassword),
    );
  }

  Stream<ChangePasswordState> _mapConfirmPasswordChangedToState(String confirmPassword) async* {
    yield state.update(
      isConfirmNewPasswordValid: Validator.isValidPassword(confirmPassword),
    );
  }

  Stream<ChangePasswordState> _mapFormSubmittedToState(String oldPassword, String newPassword) async* {
    String apiToken;
    try {
      yield ChangePasswordState.loading();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(AppPreferences.auth_token);
      apiToken = token;
      print('haha: $apiToken');
      var response = await _userRepository.changePassword(
          apiToken: apiToken, oldPassword: oldPassword, newPassword: newPassword);

      if (response.status == true) {
        yield ChangePasswordState.success(
            message: response.msg);
      } else {
        yield ChangePasswordState.failure(message: response.msg);
      }
    } catch (e) {
      yield ChangePasswordState.failure(message: e.toString());
    }
  }
}
