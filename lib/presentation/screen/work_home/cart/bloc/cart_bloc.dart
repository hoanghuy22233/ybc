import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ybc/app/constants/preferences/app_preferences.dart';
import 'package:ybc/model/local/pref.dart';
import 'package:ybc/model/repo/barrel_repo.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_event.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_state.dart';
import 'package:ybc/utils/utils.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final UserRepository userRepository;

  CartBloc({@required this.userRepository});

  @override
  CartState get initialState => CartState.empty();

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is LoadCart) {
      yield* _mapLoadCartToState();
    } else if (event is RefreshCart) {
      yield CartState.loading(state.copyWith(
          status: DioStatus(
        code: DioStatus.API_PROGRESS,
      )));
      yield* _mapLoadCartToState();
    } else if (event is RemoveCart) {
      yield CartState.loading(state.copyWith(
          status: DioStatus(
        code: DioStatus.API_PROGRESS,
      )));
      yield* _mapRemoveCartToState(event.userCartId);
    }
  }

  Stream<CartState> _mapLoadCartToState() async* {
    try {
      var prefs = LocalPref();
      var token = await prefs.getString(AppPreferences.auth_token);
      final response = await userRepository.getInformationCart(apiToken: token);
      yield CartState.success(state.update(
          carts: response.data,
          status:
              DioStatus(code: DioStatus.API_SUCCESS, message: response.msg)));
    } catch (e) {
      yield CartState.failure(
          state.update(status: DioErrorUtil.handleError(e)));
    }
  }

  Stream<CartState> _mapRemoveCartToState(int userCartId) async* {
    try {
      var prefs = LocalPref();
      var token = await prefs.getString(AppPreferences.auth_token);
      final response =
          await userRepository.cartRemove(cartId: userCartId, apiToken: token);
      yield CartState.success(state.update(
          carts: response.data,
          status: DioStatus(
              code: DioStatus.API_SUCCESS_NOTIFY, message: response.msg)));
    } catch (e) {
      yield CartState.failure(
          state.update(status: DioErrorUtil.handleError(e)));
    }
  }
}
