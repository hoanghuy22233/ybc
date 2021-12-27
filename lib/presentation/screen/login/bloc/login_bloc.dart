import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ybc/app/auth_bloc/authentication_bloc.dart';
import 'package:ybc/app/auth_bloc/bloc.dart';
import 'package:ybc/app/constants/endpoint/app_endpoint.dart';
import 'package:ybc/model/api/dio_provider.dart';
import 'package:ybc/model/repo/barrel_repo.dart';
import 'package:ybc/presentation/screen/login/bloc/bloc.dart';
import 'package:ybc/utils/utils.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;
  final AuthenticationBloc _authenticationBloc;

  LoginBloc(
      {@required UserRepository userRepository,
      AuthenticationBloc authenticationBloc})
      : assert(userRepository != null),
        _userRepository = userRepository,
        _authenticationBloc = authenticationBloc;

  @override
  get initialState => LoginState.empty();

  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
      Stream<LoginEvent> events, transitionFn) {
    final nonDebounceStream = events.where((event) {
      return (event is! LoginUsernameChanged && event is! LoginPasswordChanged);
    });

    final debounceStream = events.where((event) {
      return (event is LoginUsernameChanged || event is LoginPasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmitUsernamePasswordEvent) {
      yield* _mapLoginSubmitUsernamePasswordEventToState(
          event.email, event.password, event.lat, event.long);
    } else if (event is LoginUsernameChanged) {
      yield* _mapLoginUsernameChangedToState(event.email);
    } else if (event is LoginPasswordChanged) {
      yield* _mapLoginPasswordChangedToState(event.password);
    } else if (event is LoginFacebookEvent) {
      yield* _mapLoginFacebookEventToState(
          event.accessToken, event.lat, event.long);
    }
  }

  Stream<LoginState> _mapLoginFacebookEventToState(
      String accessToken, String lat, String long) async* {
    try {
      yield LoginState.loading();
      var response = await _userRepository.loginFacebook(
          accessToken: await _userRepository.facebookAccessToken(),
          lat: lat,
          long: long);

      print('---token----');
      print(response.data.apiToken);

      if (response.status == Endpoint.SUCCESS) {
        DioProvider.bearer(response.data.apiToken);
        yield LoginState.success(
            message: response.msg, token: response.data.apiToken);
        _authenticationBloc.add(LoggedIn(response.data.apiToken));
      } else {
        yield LoginState.failure(message: response.msg);
      }
    } catch (e) {
      yield LoginState.failure(message: "Lỗi đăng nhập");
    }
  }

  Stream<LoginState> _mapLoginSubmitUsernamePasswordEventToState(
      String username, String password, String lat, String long) async* {
    try {
      yield LoginState.loading();

      var response = await _userRepository.loginApp(
          username: username, password: password, lat: lat, long: long);
      print('---token----');
      print(response.data.apiToken);

      if (response.status == true) {
        DioProvider.bearer(response.data.apiToken);
        yield LoginState.success(
            message: response.msg, token: response.data.apiToken);
        // await _userRepository.deviceToken(
        //     deviceIdentifier: await _firebaseMessaging.getToken());
        _authenticationBloc.add(LoggedIn(response.data.apiToken));
      } else {
        yield LoginState.failure(message: response.msg);
      }
    } catch (e) {
      yield LoginState.failure(message: 'Bạn nhập sai email hoặc mật khẩu');
    }
  }

  Stream<LoginState> _mapLoginUsernameChangedToState(String userName) async* {
    yield state.update(isUsernameValid: Validator.isValidUsername(userName));
  }

  Stream<LoginState> _mapLoginPasswordChangedToState(String password) async* {
    yield state.update(isPasswordValid: Validator.isValidPassword(password));
  }
}
