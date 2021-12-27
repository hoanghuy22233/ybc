import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UpdateInformationEvent extends Equatable {
  const UpdateInformationEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends UpdateInformationEvent {
  final String name;

  NameChanged({@required this.name});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'NameChanged {name: $name}';
  }
}

class AddressChanged extends UpdateInformationEvent {
  final String address;

  AddressChanged({@required this.address});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'AddressChanged {Address: $address}';
  }
}

class DobChanged extends UpdateInformationEvent {
  final String dob;

  DobChanged({@required this.dob});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'DobChanged {Dob: $dob}';
  }
}

class TelChanged extends UpdateInformationEvent {
  final String tel;

  const TelChanged({@required this.tel});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'TelChanged {tel: $tel}';
  }
}

class EmailChanged extends UpdateInformationEvent {
  final String email;

  EmailChanged({@required this.email});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'EmailChanged {email: $email}';
  }
}

class GenderChanged extends UpdateInformationEvent {
  final String gender;

  GenderChanged({@required this.gender});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'GenderChanged {Gender: $gender}';
  }
}

class JobChanged extends UpdateInformationEvent {
  final String job;

  JobChanged({@required this.job});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'JobChanged {Job: $job}';
  }
}

class IntroChanged extends UpdateInformationEvent {
  final String intro;

  IntroChanged({@required this.intro});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'IntroChanged {Intro: $intro}';
  }
}

class UpdateInformationSubmitted extends UpdateInformationEvent {
  final String name;
  final String address;
  final String dob;
  final String tel;
  final String email;
  final String job;
  final String intro;
  final int gender;

  UpdateInformationSubmitted({
    @required this.name,
    @required this.address,
    @required this.dob,
    @required this.tel,
    @required this.email,
    @required this.job,
    @required this.intro,
    @required this.gender
  });

  @override
  List<Object> get props => [name, address, dob, tel, email,job, intro, gender];

  @override
  String toString() {
    return 'Submitted{name: $name, address: $address, Dob: $dob, tel: $tel, email: $email, job: $job, intro: $intro, Gender: $gender}';
  }
}
