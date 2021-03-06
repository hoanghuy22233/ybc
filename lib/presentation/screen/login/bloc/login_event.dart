import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUsernameChanged extends LoginEvent {
  final String email;

  LoginUsernameChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'LoginUsernameChanged{email: $email}';
  }
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() {
    return 'LoginPasswordChanged{password: $password}';
  }
}

class LoginSubmitUsernamePasswordEvent extends LoginEvent {
  final String email;
  final String password;
  final String lat;
  final String long;

  LoginSubmitUsernamePasswordEvent(
      {@required this.email,
      @required this.password,
      @required this.lat,
      @required this.long});

  @override
  List<Object> get props => [email, password, lat, long];
}

class LoginGoogleEvent extends LoginEvent {
  LoginGoogleEvent();
  @override
  List<Object> get props => [];
}

class LoginFacebookEvent extends LoginEvent {
  final String accessToken;
  final String lat;
  final String long;
  LoginFacebookEvent(
      {@required this.accessToken, @required this.lat, @required this.long});
  @override
  List<Object> get props => [accessToken, lat, long];
}
