import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class NameFormEvent extends Equatable {
  const NameFormEvent();

  @override
  List<Object> get props => [];
}

class FullnameChanged extends NameFormEvent {
  final String fullname;

  FullnameChanged({@required this.fullname});

  @override
  List<Object> get props => [fullname];

  @override
  String toString() {
    return 'FullnameChanged{fullname: $fullname}';
  }
}


class NameFormSubmitEvent extends NameFormEvent {
  final String fullname;

  NameFormSubmitEvent(
      {@required this.fullname});

  @override
  List<Object> get props => [fullname];

  @override
  String toString() {
    return 'NameFormSubmitEvent{fullname: $fullname}';
  }
}



