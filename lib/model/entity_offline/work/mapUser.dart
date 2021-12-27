import 'package:ybc/model/entity_offline/work/projectParticipatingItem.dart';

class MapUserItem {
  String image, name, dob, position, job;
  int id ,numOfProject;
  bool isExpert;
  double lat, long, star;
  List<ProjectParticipatingItem> projectParticipatingItem;

  MapUserItem({this.id,this.image,this.name,this.dob, this.position, this.job, this.lat, this.long, this.numOfProject=0, this.isExpert=false, this.star=5, this.projectParticipatingItem});
}
List<MapUserItem> mapUserItem = [
  MapUserItem(
    id: 1,
    image: 'assets/images/user1.png',
    name: 'Lê Văn A',
    dob: '1988',
    position: 'Thành viên chính thức',
    job: 'Chuyên viên kinh doanh',
    numOfProject: 3,
    lat: 21.007353,
    long: 105.781346,
    projectParticipatingItem: [
      projectParticipatingItem[0],
      projectParticipatingItem[2],
      projectParticipatingItem[5],
      projectParticipatingItem[1],
      projectParticipatingItem[7],
    ]
    ),

  MapUserItem(
    id: 2,
    image: 'assets/images/user2.png',
    name: 'Nguyễn Văn B',
    dob: '1988',
    position: 'Chuyên gia',
    job: 'Chuyên gia',
    numOfProject: 5,
    isExpert: true,
    lat: 21.008353,
    long: 105.781346,
      projectParticipatingItem: [
        projectParticipatingItem[2],
        projectParticipatingItem[8],
        projectParticipatingItem[3],
        projectParticipatingItem[1],
        projectParticipatingItem[7],
      ]
    ),

  MapUserItem(
      id: 3,
      image: 'assets/images/user3.png',
      name: 'Lê Thanh Tùng',
      dob: '1990',
      position: 'Chuyên gia',
      job: 'Chuyên gia',
      numOfProject: 2,
      isExpert: true,
      lat: 21.007353,
      long: 105.782346,
      projectParticipatingItem: [
        projectParticipatingItem[1],
        projectParticipatingItem[6],
      ]
      ),

  MapUserItem(
      id: 4,
      image: 'assets/images/user4.jpg',
      name: 'Bùi Minh Khang',
      dob: '1992',
      position: 'Thành viên chính thức',
      job: 'Chuyên viên kinh doanh',
      numOfProject:2,
      isExpert: true,
      lat: 21.009353,
      long: 105.782346,
      projectParticipatingItem: [
        projectParticipatingItem[3],
        projectParticipatingItem[5],
      ]
      ),
];