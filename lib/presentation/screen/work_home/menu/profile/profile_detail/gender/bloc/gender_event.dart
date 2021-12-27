import 'package:equatable/equatable.dart';

abstract class GenderEvent extends Equatable {
  const GenderEvent();

  @override
  List<Object> get props => [];
}

class GenderSubmitted extends GenderEvent {
  final int superId;

  GenderSubmitted(this.superId);

  @override
  List<Object> get props => [superId];

  @override
  String toString() {
    return 'GenderSubmitted{productId: $superId}';
  }
}
