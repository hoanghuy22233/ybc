import 'package:equatable/equatable.dart';
import 'package:ybc/model/entity/cart.dart';

class PaymentFormEvent extends Equatable {
  const PaymentFormEvent();

  List<Object> get props => [];
}

class InitPaymentForm extends PaymentFormEvent {
  @override
  String toString() {
    return 'InitPaymentForm{}';
  }
}

class CartLoaded extends PaymentFormEvent {
  final List<Cart> carts;

  CartLoaded(this.carts);

  List<Object> get props => [carts];

  @override
  String toString() {
    return 'CartLoaded{carts: $carts}';
  }
}

class PaymentFormSubmitted extends PaymentFormEvent {
  final String name;
  final String email;
  final String address;
  final int cityId;
  final int districtId;
  final int wardId;
  final String tel;
  final int paymentType;
  final String token;

  PaymentFormSubmitted(
      {this.name,
      this.email,
      this.address,
      this.cityId,
      this.districtId,
      this.wardId,
      this.tel,
      this.paymentType,
      this.token});

  @override
  List<Object> get props => [
        name,
        email,
        address,
        cityId,
        districtId,
        wardId,
        tel,
        paymentType,
        token
      ];

  @override
  String toString() {
    return 'PaymentFormSubmitted{}';
  }
}
