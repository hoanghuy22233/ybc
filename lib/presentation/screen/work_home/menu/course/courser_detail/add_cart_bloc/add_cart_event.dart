import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AddCartEvent extends Equatable {
  const AddCartEvent();

  @override
  List<Object> get props => [];
}


class AddCart extends AddCartEvent {
  final int courseId ;
  final String apiToken;

  const AddCart({
    @required this.courseId,
    @required this.apiToken
  });

  @override
  List<Object> get props => [courseId,apiToken];

  @override
  String toString() {
    return 'AddCart{productId: $courseId, apiToken: $apiToken}';
  }
}

class RemoveCart extends AddCartEvent {
  final int cartId;
  final String apiToken;

  RemoveCart(this.cartId, this.apiToken);

  List<Object> get props => [cartId, apiToken];

  @override
  String toString() {
    return 'RemoveCart{courseId: $cartId, apiToken: $apiToken}';
  }
}