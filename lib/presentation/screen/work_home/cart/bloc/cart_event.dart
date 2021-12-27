import 'package:equatable/equatable.dart';

class CartEvent extends Equatable {
  const CartEvent();

  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class RefreshCart extends CartEvent {}

class RemoveCart extends CartEvent {
  final int userCartId;

  RemoveCart(this.userCartId);

  List<Object> get props => [userCartId];

  @override
  String toString() {
    return 'RemoveCart{userCartId: $userCartId}';
  }
}
