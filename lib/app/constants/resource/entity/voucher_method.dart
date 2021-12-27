import 'package:equatable/equatable.dart';

class VoucherMethod extends Equatable {
  final int id;
  final String name;

  VoucherMethod(this.id, this.name);

  static final VoucherMethod voucher = VoucherMethod(1, 'Voucher');
  static final VoucherMethod rank = VoucherMethod(2, 'Thứ hạng');

  @override
  String toString() {
    return 'VoucherMethod{id: $id, name: $name}';
  }

  @override
  List<Object> get props => [id, name];
}
