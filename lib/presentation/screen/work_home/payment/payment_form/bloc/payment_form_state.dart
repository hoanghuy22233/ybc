import 'package:flutter/material.dart';
import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:ybc/utils/dio/barrel_dio.dart';

class PaymentFormState {
  final List<Cart> carts;
//  final Address address;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;
  final RankCheck rankCheckData;

  PaymentFormState({
    @required this.carts,
    // @required this.address,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.status,
    @required this.rankCheckData,
  });

  factory PaymentFormState.empty() {
    return PaymentFormState(
        carts: null,
        // address: null,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: null,
        rankCheckData: null);
  }

  factory PaymentFormState.loading(PaymentFormState state) {
    return PaymentFormState(
        carts: state.carts,
        //  address: state.address,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        status: state.status,
        rankCheckData: state.rankCheckData);
  }

  factory PaymentFormState.failure(PaymentFormState state) {
    return PaymentFormState(
        carts: state.carts,
        // address: state.address,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        status: state.status,
        rankCheckData: state.rankCheckData);
  }

  factory PaymentFormState.success(PaymentFormState state) {
    return PaymentFormState(
        carts: state.carts,
        //   address: state.address,
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        status: state.status,
        rankCheckData: state.rankCheckData);
  }

  PaymentFormState update(
      {List<Cart> carts,
      Address address,
      // Bank bank,
      DioStatus status,
      RankCheck rankCheckData}) {
    return copyWith(
        carts: carts,
        address: address,
        //  bank: bank,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: status,
        rankCheckData: rankCheckData);
  }

  PaymentFormState copyWith(
      {List<Cart> carts,
      Address address,
      //  Bank bank,
      bool isSubmitting,
      bool isSuccess,
      bool isFailure,
      DioStatus status,
      RankCheck rankCheckData}) {
    return PaymentFormState(
        carts: carts ?? this.carts,
        //  address: address ?? this.address,
        //    bank: bank ?? this.bank,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure,
        status: status ?? this.status,
        rankCheckData: rankCheckData ?? this.rankCheckData);
  }

  @override
  String toString() {
    return 'PaymentFormState{carts: $carts, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
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

  bool checkReadyToOrder() {
    var ready = true;
    if (carts == null) {
      ready = false;
    }

    return ready;
  }
}
