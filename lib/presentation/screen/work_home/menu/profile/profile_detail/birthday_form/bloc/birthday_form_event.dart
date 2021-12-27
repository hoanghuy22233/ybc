import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class BirthdayFormEvent extends Equatable {
  const BirthdayFormEvent();

  @override
  List<Object> get props => [];
}


class BirthdayFormSubmitEvent extends BirthdayFormEvent {
  final String birthDay;

  BirthdayFormSubmitEvent(
      {@required this.birthDay});

  @override
  List<Object> get props => [birthDay];

  @override
  String toString() {
    return 'BirthdayFormSubmitEvent{birthDay: $birthDay}';
  }
}



