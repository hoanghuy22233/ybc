import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class HistoryOrderEvent extends Equatable {
  const HistoryOrderEvent();

  List<Object> get props => [];
}

class LoadHistoryOrder extends HistoryOrderEvent {
  final int status;
  final int type;

  LoadHistoryOrder(
      {@required this.status,@required this.type});

  @override
  List<Object> get props => [status, type];

  @override
  String toString() {
    return 'HistoryOrderEvent{status: $status, type: $type}';
  }
}

class RefreshHistoryOrder extends HistoryOrderEvent {
  final int status;
  final int type;

  RefreshHistoryOrder(
      {@required this.status,@required this.type});

  @override
  List<Object> get props => [status, type];

  @override
  String toString() {
    return 'HistoryOrderEvent{status: $status, type: $type}';
  }
}
