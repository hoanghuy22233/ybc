import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ProfileDetailAvatarEvent extends Equatable {
  const ProfileDetailAvatarEvent();

  @override
  List<Object> get props => [];
}


class ProfileDetailAvatarUploadEvent extends ProfileDetailAvatarEvent {
  final File avatarFile;

  ProfileDetailAvatarUploadEvent(
      {@required this.avatarFile});

  @override
  List<Object> get props => [avatarFile];

  @override
  String toString() {
    return 'ProfileDetailAvatarUploadEvent{avatarFile: $avatarFile}';
  }
}



