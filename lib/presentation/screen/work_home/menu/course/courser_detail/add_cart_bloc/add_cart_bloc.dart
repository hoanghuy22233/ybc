import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiver/async.dart';
import 'package:ybc/app/constants/endpoint/app_endpoint.dart';
import 'package:ybc/app/constants/preferences/app_preferences.dart';
import 'package:ybc/model/local/pref.dart';
import 'package:ybc/model/repo/user_repository.dart';

import 'bloc.dart';

class AddCartBloc
    extends Bloc<AddCartEvent, AddCartState> {
  final UserRepository _userRepository;

  StreamSubscription _streamSubscription;

  AddCartBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AddCartState get initialState => AddCartState.empty();

  @override
  Stream<AddCartState> mapEventToState(
      AddCartEvent event) async* {
    if (event is AddCart) {
      yield* _mapAddCartToState(event.apiToken, event.courseId);
    } else if (event is RemoveCart) {
      yield* _mapRemoveCartItemState(event.apiToken, event.cartId);
    }
  }


  Stream<AddCartState> _mapAddCartToState(
      String apiToken, int courseId) async* {
    yield AddCartState.loading();
    try {

      var response = await _userRepository.cartAdd(apiToken: apiToken ,courseId: courseId);

      if (response.status == Endpoint.SUCCESS) {
        yield AddCartState.success(message: response.msg);
      } else {
        yield AddCartState.failure(message: response.msg);
      }
    } catch (e) {
      print(e.toString());
      yield AddCartState.failure(message: e.toString());
    }
  }

  Stream<AddCartState> _mapRemoveCartItemState(
      String apiToken, int cartId) async* {
    yield AddCartState.loading();
    try {

      var response = await _userRepository.cartRemove(apiToken: apiToken , cartId: cartId);

      if (response.status == Endpoint.SUCCESS) {
        yield AddCartState.success(message: response.msg);
      } else {
        yield AddCartState.failure(message: response.msg);
      }
    } catch (e) {
      print(e.toString());
      yield AddCartState.failure(message: e.toString());
    }
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
