class NotificationType {
  final int id;
  final String name;

  NotificationType(this.id, this.name);

  static final NotificationType order =
  NotificationType(1, 'Đơn hàng');
  static final NotificationType promotion =
  NotificationType(2, 'Khuyến mãi');
}
