import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class IntroFormEvent extends Equatable {
  const IntroFormEvent();

  @override
  List<Object> get props => [];
}

class IntroChanged extends IntroFormEvent {
  final String intro;

  IntroChanged({@required this.intro});

  @override
  List<Object> get props => [intro];

  @override
  String toString() {
    return 'IntroChanged{Intro: $intro}';
  }
}

class IntroFormSubmitEvent extends IntroFormEvent {
  final String intro;

  IntroFormSubmitEvent({@required this.intro});

  @override
  List<Object> get props => [intro];

  @override
  String toString() {
    return 'IntroFormSubmitEvent{Intro: $intro}';
  }
}
