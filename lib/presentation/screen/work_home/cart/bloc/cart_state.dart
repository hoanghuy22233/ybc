import 'package:meta/meta.dart';
import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:ybc/utils/dio/barrel_dio.dart';

class CartState {
  final List<Cart> carts;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  CartState(
      {@required this.carts,
      @required this.isLoading,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.status});

  factory CartState.empty() {
    return CartState(
        carts: null,
        isLoading: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory CartState.loading(CartState state) {
    return CartState(
        carts: state.carts,
        isLoading: true,
        isSuccess: false,
        isFailure: false,
        status: state.status);
  }

  factory CartState.failure(CartState state) {
    return CartState(
        carts: state.carts,
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        status: state.status);
  }

  factory CartState.success(CartState state) {
    return CartState(
        carts: state.carts,
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        status: state.status);
  }

  CartState update(
      {List<Cart> carts,
      bool isLoading,
      bool isSuccess,
      bool isFailure,
      DioStatus status}) {
    return copyWith(
      carts: carts,
      isLoading: false,
      isSuccess: false,
      isFailure: false,
      status: status,
    );
  }

  CartState copyWith({
    List<Cart> carts,
    bool isLoading,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return CartState(
      carts: carts ?? this.carts,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  double getTotalInvoice() {
    if (carts != null) {
      double totalPrice = 0;
      for (int i = 0; i < carts.length; i++) {
        if (carts[i].finalPrice != 0) {
          totalPrice += carts[i].finalPrice;
        }
      }
      return totalPrice;
    } else {
      return 0;
    }
  }

  @override
  String toString() {
    return 'CartState{carts: $carts, isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
