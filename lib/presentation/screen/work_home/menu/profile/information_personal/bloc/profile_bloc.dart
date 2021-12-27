import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ybc/model/local/pref.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/utils/dio/dio_error_util.dart';

import 'bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository _userRepository;


  ProfileBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  ProfileState get initialState => ProfileLoading();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is LoadProfile) {
      yield* _mapLoadProfileToState();
    } else if (event is RefreshProfile) {
      yield ProfileLoading();
      yield* _mapLoadProfileToState();
    }
  }

  Stream<ProfileState> _mapLoadProfileToState() async* {
    try {
      final profileResponse = await _userRepository.getProfile();
      print('-----------------');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userName', profileResponse.data.name);
      yield ProfileLoaded(profileResponse.data);
    } catch (e) {
      yield ProfileNotLoaded(DioErrorUtil.handleError(e));
//      yield ProfileNotLoaded(e);
    }
  }
}
