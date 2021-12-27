import 'package:ybc/model/entity_offline/work/mapUser.dart';

class RateItemItem {
  final int id;
  final String content;
  final String time;
  final int star;
  final MapUserItem userParticipate;
  RateItemItem({this.id, this.userParticipate, this.content, this.time, this.star});
}
List<RateItemItem> rateItem = [

  RateItemItem(
    id: 1,
    content: 'Thân thiện, nhiệt tình. Hoạt động thường xuyên. Đáng tin cậy',
    star: 5,
    time: '15/01/2020',
    userParticipate: mapUserItem[0],
  ),

  RateItemItem(
    id: 2,
    content: 'Thân thiện, xây dựng tốt',
    star: 5,
    time: '24/06/2020',
    userParticipate: mapUserItem[1],
  ),

  RateItemItem(
    id: 3,
    content: 'Năng nổ, đáng để học hỏi. Đóng góp vào dự án nhiều',
    star: 5,
    time: '21/01/2021',
    userParticipate: mapUserItem[2],
  ),

  RateItemItem(
    id: 4,
    content: 'Thân thiện, nhiệt tình. Hoạt động thường xuyên. Đáng tin cậy. Thân thiện, nhiệt tình. Hoạt động thường xuyên. Đáng tin cậy',
    star: 5,
    time: '14/02/2021',
    userParticipate: mapUserItem[3],
  ),

];