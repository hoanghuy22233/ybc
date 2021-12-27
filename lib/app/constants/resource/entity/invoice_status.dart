import 'package:equatable/equatable.dart';

class InvoiceStatus extends Equatable {
  final int id;
  final String name;

  InvoiceStatus(
    this.id,
    this.name,
  );

  static final InvoiceStatus waiting = InvoiceStatus(0, 'Chờ duyệt');
  static final InvoiceStatus shipping = InvoiceStatus(1, 'Đang giao hàng');
  static final InvoiceStatus completed = InvoiceStatus(
    2,
    'Hoàn thành',
  );
  static final InvoiceStatus adminCanceled = InvoiceStatus(
    3,
    'Đơn hàng bị hủy',
  );
  static final InvoiceStatus userCanceled = InvoiceStatus(
    4,
    'Bạn đã hủy đơn',
  );

  @override
  String toString() {
    return 'InvoiceStatus{id: $id, name: $name}';
  }

  @override
  List<Object> get props => [id, name];

  static InvoiceStatus getInvoiceStatus(int status) {
    switch (status) {
      case 1:
        return InvoiceStatus.shipping;
      case 2:
        return InvoiceStatus.completed;
      case 3:
        return InvoiceStatus.adminCanceled;
      case 4:
        return InvoiceStatus.userCanceled;
      default:
        return InvoiceStatus.waiting;
    }
  }
}
