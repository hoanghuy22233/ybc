import 'package:equatable/equatable.dart';
import 'package:ybc/model/entity/order_data.dart';
import 'package:ybc/model/entity/user.dart';
import 'package:ybc/utils/dio/dio_status.dart';

abstract class HistoryOrderState extends Equatable {
  const HistoryOrderState();

  @override
  List<Object> get props => [];
}

class HistoryOrderLoading extends HistoryOrderState {
}

class HistoryOrderLoaded extends HistoryOrderState {
  final OrderData orderData;

  HistoryOrderLoaded(this.orderData); //  final User user;

  @override
  List<Object> get props => [orderData];

  @override
  String toString() {
    return 'HistoryOrderLoaded{user: $orderData}';
  }
}

class HistoryOrderNotLoaded extends HistoryOrderState {
  final DioStatus error;

  HistoryOrderNotLoaded(this.error);

  @override
  String toString() {
    return 'HistoryOrderNotLoaded{error: $error}';
  }
}
