import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class CareerFormEvent extends Equatable {
  const CareerFormEvent();

  @override
  List<Object> get props => [];
}

class CareerChanged extends CareerFormEvent {
  final String career;

  CareerChanged({@required this.career});

  @override
  List<Object> get props => [career];

  @override
  String toString() {
    return 'CareerChanged{Career: $career}';
  }
}

class CareerFormSubmitEvent extends CareerFormEvent {
  final String career;

  CareerFormSubmitEvent({@required this.career});

  @override
  List<Object> get props => [career];

  @override
  String toString() {
    return 'CareerFormSubmitEvent{Career: $career}';
  }
}
