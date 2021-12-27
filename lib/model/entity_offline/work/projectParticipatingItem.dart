import 'package:ybc/model/entity_offline/work/mapUser.dart';

class ProjectParticipatingItem {
  final int id;
  final String image;
  final String name;
  final String areaProject;
  final String scaleOfProject;
  final List<MapUserItem> userParticipate;
  ProjectParticipatingItem({
    this.id,
    this.image = 'assets/images/ybc.png',
    this.name,
    this.areaProject,
    this.scaleOfProject,
    this.userParticipate
  });
}
List<ProjectParticipatingItem> projectParticipatingItem = [

  ProjectParticipatingItem(
    id: 1,
    scaleOfProject: 'Lớn',
    name: 'Phát triển app bất động sản',
    areaProject: 'App di động',
    userParticipate: [
      mapUserItem[0],
      mapUserItem[1],
    ]
  ),

  ProjectParticipatingItem(
      id: 2,
    scaleOfProject: 'Lớn',
    name: 'Phát triển app tài chính',
    areaProject: 'App di động',
    userParticipate: [
      mapUserItem[0],
      mapUserItem[1],
      mapUserItem[2],
      mapUserItem[3],
    ]
  ),

  ProjectParticipatingItem(
      id: 3,
    scaleOfProject: 'Vừa',
    name: 'Phát triển web bán giày',
    areaProject: 'Web',
    userParticipate: [
      mapUserItem[1],
      mapUserItem[2],
      mapUserItem[3],
    ]
  ),

  ProjectParticipatingItem(
      id: 4,
    scaleOfProject: 'Lớn',
    name: 'Phát triển app bất động sản',
    areaProject: 'App di động',
    userParticipate: [
      mapUserItem[0],
      mapUserItem[1],
      mapUserItem[2],
    ]
  ),

  ProjectParticipatingItem(
      id: 5,
    scaleOfProject: 'Lớn',
    name: 'Phát triển app tài chính',
    areaProject: 'App di động',
    userParticipate: [
      mapUserItem[0],
      mapUserItem[1],
      mapUserItem[3],
    ]
  ),

  ProjectParticipatingItem(
      id: 6,
    scaleOfProject: 'Lớn',
    name: 'Phát triển web bán giày',
    areaProject: 'Web',
    userParticipate: [
      mapUserItem[1],
      mapUserItem[2],
      mapUserItem[3],
    ]
  ),

  ProjectParticipatingItem(
      id: 7,
    scaleOfProject: 'Lớn',
    name: 'Phát triển app bất động sản',
    areaProject: 'App di động',
    userParticipate: [
      mapUserItem[0],
      mapUserItem[1],
      mapUserItem[2],
    ]
  ),

  ProjectParticipatingItem(
      id: 8,
    scaleOfProject: 'Lớn',
    name: 'Phát triển app tài chính',
    areaProject: 'App di động',
    userParticipate: [
      mapUserItem[0],
      mapUserItem[1],
      mapUserItem[3],
    ]
  ),

  ProjectParticipatingItem(
      id: 9,
    scaleOfProject: 'Lớn',
    name: 'Phát triển web bán giày',
    areaProject: 'Web',
    userParticipate: [
      mapUserItem[1],
      mapUserItem[2],
      mapUserItem[3],
    ]
  ),

];