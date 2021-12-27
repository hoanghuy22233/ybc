import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class EmailFormEvent extends Equatable {
  const EmailFormEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends EmailFormEvent {
  final String email;

  EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'EmailChanged{email: $email}';
  }
}


class EmailFormSubmitEvent extends EmailFormEvent {
  final String email;

  EmailFormSubmitEvent(
      {@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'EmailFormSubmitEvent{email: $email}';
  }
}



