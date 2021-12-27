import 'package:ybc/model/entity_offline/work/mapUser.dart';

class AppointmentItem {
  final int id;
  final String name;
  final double price;
  AppointmentItem({this.id, this.name, this.price});

  static List<AppointmentItem> getItem() {
    return<AppointmentItem>[
      AppointmentItem(
          id: 1,
          name: 'Call Zoom',
          price: 200000
      ),
      AppointmentItem(
          id: 2,
          name: 'Facebook',
          price: 200000
      ),
      AppointmentItem(
          id: 3,
          name: 'Teamview',
          price: 200000
      ),
      AppointmentItem(
          id: 4,
          name: 'Gặp trực tiếp',
          price: 1500000
      ),
    ];
  }
}