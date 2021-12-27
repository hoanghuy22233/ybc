import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AddressFormEvent extends Equatable {
  const AddressFormEvent();

  @override
  List<Object> get props => [];
}

class AddressChanged extends AddressFormEvent {
  final String address;

  AddressChanged({@required this.address});

  @override
  List<Object> get props => [address];

  @override
  String toString() {
    return 'AddressChanged{address: $address}';
  }
}

class AddressFormSubmitEvent extends AddressFormEvent {
  final String address;

  AddressFormSubmitEvent({@required this.address});

  @override
  List<Object> get props => [address];

  @override
  String toString() {
    return 'AddressFormSubmitEvent{address: $address}';
  }
}
