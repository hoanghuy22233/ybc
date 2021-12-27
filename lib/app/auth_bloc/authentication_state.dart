import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {

  const Authenticated();

  @override
  List<Object> get props => [];

}

class Unauthenticated extends AuthenticationState {}
