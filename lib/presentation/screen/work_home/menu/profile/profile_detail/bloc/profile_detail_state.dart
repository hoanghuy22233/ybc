import 'package:equatable/equatable.dart';

abstract class ProfileDetailState extends Equatable {
  const ProfileDetailState();

  @override
  List<Object> get props => [];
}

class ProfileDetailLoaded extends ProfileDetailState {}

class ProfileDetailFullnameFormOpened extends ProfileDetailState {}

class ProfileDetailPhoneFormOpened extends ProfileDetailState {}

class ProfileDetailEmailFormOpened extends ProfileDetailState {}

class ProfileDetailBirthdayFormOpened extends ProfileDetailState {}

class ProfileDetailAddressFormOpened extends ProfileDetailState {}

class ProfileDetailSuplifeFormOpened extends ProfileDetailState {}

class ProfileDetailIntroFormOpened extends ProfileDetailState {}

class ProfileDetailJobFormOpened extends ProfileDetailState {}
