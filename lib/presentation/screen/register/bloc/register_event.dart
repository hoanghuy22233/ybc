import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends RegisterEvent {
  final String name;

  NameChanged({@required this.name});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'NameChanged {name: $name}';
  }
}

class PasswordChanged extends RegisterEvent {
  final String password;

  PasswordChanged({@required this.password});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'PasswordChanged {password: $password}';
  }
}

class RePasswordChanged extends RegisterEvent {
  final String password;
  final String rePassword;

  RePasswordChanged({@required this.password, @required this.rePassword});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'RePasswordChanged {Password: $password, rePassword: $rePassword}';
  }
}

class TelChanged extends RegisterEvent {
  final String tel;

  const TelChanged({@required this.tel});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'TelChanged {tel: $tel}';
  }
}

class EmailChanged extends RegisterEvent {
  final String email;

  EmailChanged({@required this.email});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'EmailChanged {email: $email}';
  }
}

class TypeChanged extends RegisterEvent {
  final int type;

  TypeChanged({@required this.type});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'TypeChanged {type: $type}';
  }
}

class RegisterSubmitted extends RegisterEvent {
  final String name;
  final String password;
  final String rePassword;
  final String tel;
  final String email;
  final int type;

  RegisterSubmitted({
    @required this.name,
    @required this.password,
    @required this.rePassword,
    @required this.tel,
    @required this.email,
    @required this.type
  });

  @override
  List<Object> get props => [name, password, rePassword, tel, email, type];

  @override
  String toString() {
    return 'Submitted{name: $name, password: $password, rePassword: $rePassword, tel: $tel, email: $email, type: $type}';
  }
}
