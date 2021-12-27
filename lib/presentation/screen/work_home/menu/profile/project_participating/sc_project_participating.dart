import 'package:flutter/material.dart';
import 'package:ybc/model/entity_offline/work/mapUser.dart';
import 'package:ybc/model/entity_offline/work/projectParticipatingItem.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_account/widget_appbar_not_search.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/project_participating/widget_item_paticipating.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/project_participating_detail/sc_detail_project_participating.dart';
import 'package:ybc/utils/locale/app_localization.dart';

class ProjectParticipatingScreen extends StatefulWidget {

  @override
  _ProjectParticipatingScreenState createState() => _ProjectParticipatingScreenState();
}

class _ProjectParticipatingScreenState extends State<ProjectParticipatingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          child: Column(
            children: [
              _buildAppbar(AppLocalizations.of(context).translate('project_participating.title')),
              Expanded(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    color: Colors.transparent,
                    //      margin: EdgeInsets.symmetric(horizontal: 20),
                    child:
                    // projectParticipatingItem?.length != 0 || projectParticipatingItem?.length == null ?
                    //   ListView.builder(
                    //     itemCount: projectParticipatingItem?.length == null ? 0 : projectParticipatingItem?.length,
                    //     itemBuilder: (context, index) {
                    //       return WidgetItemParticipating(
                    //         title: projectParticipatingItem[index]?.name,
                    //         ontap: (){
                    //           // Navigator.push(
                    //           //   context,
                    //           //   MaterialPageRoute(builder: (context) => ProjectParticipatingDetailScreen(id: index,)),
                    //           // );
                    //         },
                    //       );
                    //     },
                    //   ) :
                    //     Text('Bạn chưa tham gia dự án nào')
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 120,
                              width: 120,
                              child: Image.asset('assets/images/box.png')
                          ),
                          SizedBox(height: 20,),
                          Text('Chưa có dự án tham gia!'),
                          // WidgetItemParticipating(title: 'Phát triển app bất động sản',ontap: (){
                          // },),
                          // WidgetItemParticipating(title: 'Phát triển app tài chính',ontap: (){},),
                          // WidgetItemParticipating(title: 'Phát triển web bán giày',ontap: (){},),
                          // WidgetItemParticipating(title: 'Phát triển app bất động sản',ontap: (){},),
                          // WidgetItemParticipating(title: 'Phát triển app bất động sản',ontap: (){},),
                          // WidgetItemParticipating(title: 'Phát triển app bất động sản',ontap: (){},),
                          // WidgetItemParticipating(title: 'Phát triển app bất động sản',ontap: (){},),
                          // WidgetItemParticipating(title: 'Phát triển app bất động sản',ontap: (){},),
                          // WidgetItemParticipating(title: 'Phát triển app bất động sản',ontap: (){},),
                          // WidgetItemParticipating(title: 'Phát triển app bất động sản',ontap: (){},),
                          // WidgetItemParticipating(title: 'Phát triển app bất động sản',ontap: (){},),
                          // WidgetItemParticipating(title: 'Phát triển app bất động sản',ontap: (){},),
                          // WidgetItemParticipating(title: 'Phát triển app bất động sản',ontap: (){},),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  _buildAppbar(String title) => WidgetAppbarNotSearch(
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    title: title,
    left: [
      WidgetAppbarMenuBack()
    ],
  );

}
