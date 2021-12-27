import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class PhoneFormEvent extends Equatable {
  const PhoneFormEvent();

  @override
  List<Object> get props => [];
}

class PhoneChanged extends PhoneFormEvent {
  final String phone;

  PhoneChanged({@required this.phone});

  @override
  List<Object> get props => [phone];

  @override
  String toString() {
    return 'PhoneChanged{Phone: $phone}';
  }
}


class PhoneFormSubmitEvent extends PhoneFormEvent {
  final String phone;

  PhoneFormSubmitEvent(
      {@required this.phone});

  @override
  List<Object> get props => [phone];

  @override
  String toString() {
    return 'PhoneFormSubmitEvent{Phone: $phone}';
  }
}



