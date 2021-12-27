import 'package:equatable/equatable.dart';

class ProfileDetailEvent extends Equatable {
  const ProfileDetailEvent();

  List<Object> get props => [];
}

class OpenFullnameForm extends ProfileDetailEvent {}

class OpenPhoneForm extends ProfileDetailEvent {}

class OpenEmailForm extends ProfileDetailEvent {}

class OpenBirthdayForm extends ProfileDetailEvent {}

class OpenAddressForm extends ProfileDetailEvent {}

class OpenSuplifeForm extends ProfileDetailEvent {}

class OpenJobForm extends ProfileDetailEvent {}

class OpenIntroForm extends ProfileDetailEvent {}
