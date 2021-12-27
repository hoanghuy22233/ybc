import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/endpoint/app_endpoint.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/avatar/bloc/profile_detail_avatar_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/avatar/bloc/profile_detail_avatar_state.dart';
import 'package:ybc/utils/dio/dio_error_util.dart';
import 'package:ybc/utils/dio/dio_status.dart';

class ProfileDetailAvatarBloc
    extends Bloc<ProfileDetailAvatarEvent, ProfileDetailAvatarState> {
  final UserRepository _userRepository;

  ProfileDetailAvatarBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  get initialState => ProfileDetailAvatarState.empty();

//  @override
//  Stream<Transition<ProfileDetailAvatarEvent, ProfileDetailAvatarState>> transformEvents(
//      Stream<ProfileDetailAvatarEvent> events, transitionFn) {
//    final nonDebounceStream = events.where((event) {
//      return (event is! FullBirthdayChanged);
//    });
//
//    final debounceStream = events.where((event) {
//      return (event is FullBirthdayChanged);
//    }).debounceTime(Duration(milliseconds: 300));
//
//    return super.transformEvents(
//        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
//  }

  @override
  Stream<ProfileDetailAvatarState> mapEventToState(
      ProfileDetailAvatarEvent event) async* {
    if (event is ProfileDetailAvatarUploadEvent) {
      yield* _mapProfileDetailAvatarUploadEventToState(event.avatarFile);
    }
  }

  Stream<ProfileDetailAvatarState> _mapProfileDetailAvatarUploadEventToState(
      File avatarFile) async* {
    try {
      yield ProfileDetailAvatarState.loading();

      var response = await _userRepository.updateAvatar(avatarFile: avatarFile);
      print('---token----');
      print(response);

      if (response.status == Endpoint.SUCCESS) {
        yield ProfileDetailAvatarState.success(
            status: DioStatus(
                message: response.msg, code: DioStatus.API_SUCCESS_NOTIFY),);

      } else {
        yield ProfileDetailAvatarState.failure(
            status: DioStatus(
                message: response.msg, code: DioStatus.API_FAILURE_NOTIFY));
      }
    } catch (e) {
      yield ProfileDetailAvatarState.failure(
          status: DioErrorUtil.handleError(e));
    }
  }

//  Stream<ProfileDetailAvatarState> _mapFullBirthdayChangedToState(String Birthday) async* {
//    yield state.update(isBirthdayValid: Validator.isValidFullBirthday(Birthday));
//  }
}
