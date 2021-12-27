import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiver/async.dart';
import 'package:ybc/app/constants/endpoint/app_endpoint.dart';
import 'package:ybc/app/constants/preferences/app_preferences.dart';
import 'package:ybc/model/local/pref.dart';
import 'package:ybc/model/repo/user_repository.dart';

import 'bloc.dart';

class UpdateLocationBloc
    extends Bloc<UpdateLocationEvent, UpdateLocationState> {
  final UserRepository _userRepository;

  StreamSubscription _streamSubscription;

  UpdateLocationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  UpdateLocationState get initialState => UpdateLocationState.empty();

  @override
  Stream<UpdateLocationState> mapEventToState(
      UpdateLocationEvent event) async* {
        if (event is UpdateLocationSubmit) {
          yield* _mapUpdateLocationToState(event.apiToken, event.lat, event.long);
    }
  }


  Stream<UpdateLocationState> _mapUpdateLocationToState(
      String apiToken, String lat, String long) async* {
    yield UpdateLocationState.loading();
    try {

      var response = await _userRepository.updateLocation(apiToken: apiToken ,lat: lat, long: long);

      if (response.status == Endpoint.SUCCESS) {
        yield UpdateLocationState.success(message: response.msg);
      } else {
        yield UpdateLocationState.failure(message: response.msg);
      }
    } catch (e) {
      print(e.toString());
      yield UpdateLocationState.failure(message: e.toString());
    }
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
