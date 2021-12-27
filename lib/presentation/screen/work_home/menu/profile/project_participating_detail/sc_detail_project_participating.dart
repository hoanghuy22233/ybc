
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/entity_offline/work/projectParticipatingItem.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_appbar_not_search.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/widget_dialog_infor_account.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/project_participating_detail/widget_detail_paticipating.dart';
import 'package:ybc/utils/locale/app_localization.dart';

class ProjectParticipatingDetailScreen extends StatefulWidget {
  ProjectParticipatingDetailScreen({Key key, this.id}) : super(key: key);
  final int id;

  @override
  _ProjectParticipatingDetailScreenState createState() => _ProjectParticipatingDetailScreenState();
}

class _ProjectParticipatingDetailScreenState extends State<ProjectParticipatingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildAppbar(),
          Container(
            padding: EdgeInsets.only(top: 80),
            //color: Colors.white,
            //      margin: EdgeInsets.symmetric(horizontal: 20),
            child:
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(overflow: Overflow.visible, children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Image.asset(
                        'assets/images/banner.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      bottom: -40,
                      left: MediaQuery.of(context).size.width * 0.4 - 5,
                      child: Container(
                        height: 70,
                        width: 70,
                        margin: EdgeInsets.only(top: 5, left: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(projectParticipatingItem[widget.id].image),
                        ),
                      ),
                    )
                  ]),
                  Container(
                    height: 60,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(projectParticipatingItem[widget.id].name ,
                              style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith()),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            'Lĩnh vực: ${projectParticipatingItem[widget.id].areaProject}',
                            style: AppStyle.DEFAULT_SMALL,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            'Quy mô: ${projectParticipatingItem[widget.id].scaleOfProject}',
                            style: AppStyle.DEFAULT_SMALL,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: Text(
                            'Thành viên trong dự án',
                            style: AppStyle.DEFAULT_MEDIUM_BOLD,
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        SizedBox(
                          height: projectParticipatingItem[widget.id].userParticipate.length * 80.toDouble(),
                          child: ListView.builder(
                            shrinkWrap: false,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: projectParticipatingItem[widget.id].userParticipate.length,
                            itemBuilder: (context, index) {
                              return WidgetMemberParticipating(
                                fullName: projectParticipatingItem[widget.id].userParticipate[index].name,
                                image: projectParticipatingItem[widget.id].userParticipate[index].image,
                                job: projectParticipatingItem[widget.id].userParticipate[index].job,
                                position: projectParticipatingItem[widget.id].userParticipate[index].position,
                                ontap: (){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return WidgetDialogInfo(
                                          title: AppLocalizations.of(context).translate('list_rate.info_account'),
                                          image: projectParticipatingItem[widget.id].userParticipate[index].image,
                                          job: projectParticipatingItem[widget.id].userParticipate[index].job,
                                          position: projectParticipatingItem[widget.id].userParticipate[index].position,
                                          fullName: projectParticipatingItem[widget.id].userParticipate[index].name,
                                          isExpert: projectParticipatingItem[widget.id].userParticipate[index].isExpert,
                                        );
                                      });
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  _buildAppbar() => WidgetAppbarNotSearch(
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    title: AppLocalizations.of(context).translate('project_participating.detail'),
    left: [WidgetAppbarMenuBack()],
  );

}
