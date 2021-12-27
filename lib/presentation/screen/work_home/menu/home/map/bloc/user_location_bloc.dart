import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/utils/dio/dio_error_util.dart';

import 'bloc.dart';


class UserLocationBloc extends Bloc<UserLocationEvent, UserLocationState> {
  final UserRepository _userRepository;

  UserLocationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  UserLocationState get initialState => UserLocationLoading();

  @override
  Stream<UserLocationState> mapEventToState(UserLocationEvent event) async* {
    if (event is LoadUserLocation) {
      yield* _mapLoadUserLocationToState();
    } else if (event is RefreshUserLocation) {
      yield UserLocationLoading();
      yield* _mapLoadUserLocationToState();
    }
  }

  Stream<UserLocationState> _mapLoadUserLocationToState() async* {
    try {
      final userLocationResponse = await _userRepository.getUserLocation();
      print('-----------------');
      yield UserLocationLoaded(userLocationResponse.data);
    } catch (e) {
      yield UserLocationNotLoaded(DioErrorUtil.handleError(e));
//      yield UserLocationNotLoaded(e);
    }
  }
}
