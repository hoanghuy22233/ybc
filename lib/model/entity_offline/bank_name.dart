class BankName {
  final String image, name;

  BankName({
    this.image,
    this.name,
  });
}

List<BankName> allBank = [
  BankName(
    image: 'assets/icons/logo-momo.jpg',
    name: "Thanh toán bằng ví MOMO",
  ),
  BankName(
    image: 'assets/icons/viettel.jpg',
    name: "Thanh toán bằng ví ViettelPay",
  ),
  BankName(
    image: 'assets/icons/atm.jpg',
    name: "Thẻ ATM",
  ),
  BankName(
    image: 'assets/images/img_payment_method_e_wallet.png',
    name: "Ví điện tử",
  ),
  BankName(
    image: 'assets/icons/50268.png',
    name: "Chuyển khoản hoặc tiền mặt",
  ),
];
