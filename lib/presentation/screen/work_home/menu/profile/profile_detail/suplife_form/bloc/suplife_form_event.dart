import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SuplifeFormEvent extends Equatable {
  const SuplifeFormEvent();

  @override
  List<Object> get props => [];
}

class SuplifeChanged extends SuplifeFormEvent {
  final String suplife;

  SuplifeChanged({@required this.suplife});

  @override
  List<Object> get props => [suplife];

  @override
  String toString() {
    return 'SuplifeChanged{suplife: $suplife}';
  }
}

class SuplifeFormSubmitEvent extends SuplifeFormEvent {
  final String suplife;

  SuplifeFormSubmitEvent({@required this.suplife});

  @override
  List<Object> get props => [suplife];

  @override
  String toString() {
    return 'SuplifeFormSubmitEvent{suplife: $suplife}';
  }
}
