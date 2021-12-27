class PaymentTimeDelivery {
  final DateTime dateTime;
  final String dayString;


  static final startDay = DateTime.now();
  static const TOTAL_DAY = 7;

  PaymentTimeDelivery(this.dateTime, this.dayString);

  static List<PaymentTimeDelivery> getPaymentTimeDelivery() {
    var days = List<PaymentTimeDelivery>();
    for (int i = 0; i <= TOTAL_DAY; i++) {
      var datetime = startDay.add(Duration(days: i));
      var dayString = '${datetime.day}-${datetime.month}-${datetime.year}';

      days.add(PaymentTimeDelivery(datetime, dayString  ));

    }
    return days;
  }

  @override
  String toString() {
    return 'PaymentTimeDelivery{dateTime: $dateTime, dayString: $dayString}';
  }
}
