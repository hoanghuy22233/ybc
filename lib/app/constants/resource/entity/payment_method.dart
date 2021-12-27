import 'package:equatable/equatable.dart';

class PaymentMethod extends Equatable {
  final int id;
  final String name;
  final String imageAssets;

  PaymentMethod(this.id, this.name, this.imageAssets);

  static final PaymentMethod cashOnDelivery = PaymentMethod(1,
      'Thanh toán khi nhận hàng', 'assets/images/img_payment_method_cod.png');
  static final PaymentMethod bankTransfer = PaymentMethod(
      2, 'Chuyển khoản ngân hàng', 'assets/images/img_payment_method_bank.png');
  static final PaymentMethod eWallet = PaymentMethod(
      3, 'Sử dụng ví điện tử', 'assets/images/img_payment_method_e_wallet.png');

  static PaymentMethod getPaymentMethod(int paymentMethodId) {
    switch (paymentMethodId) {
      case 1:
        return PaymentMethod.cashOnDelivery;
      case 2:
        return PaymentMethod.bankTransfer;
      case 3:
        return PaymentMethod.eWallet;
      default:
        return PaymentMethod.cashOnDelivery;
    }
  }

  @override
  String toString() {
    return 'PaymentMethod{id: $id, name: $name, imageAssets: $imageAssets}';
  }

  @override
  List<Object> get props => [id, name, imageAssets];
}
