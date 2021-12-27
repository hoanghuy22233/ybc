
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/entity_offline/work/projectParticipatingItem.dart';
import 'package:ybc/model/entity_offline/work/rateItem.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_appbar_not_search.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/list_rate/widget_item_rate.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/project_participating/widget_item_paticipating.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/project_participating_detail/sc_detail_project_participating.dart';
import 'package:ybc/utils/locale/app_localization.dart';

class ListRateScreen extends StatefulWidget {
  ListRateScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ListRateScreenState createState() => _ListRateScreenState();
}

class _ListRateScreenState extends State<ListRateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            _buildAppbar(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 120,
                      width: 120,
                      child: Image.asset('assets/images/box.png')
                  ),
                  SizedBox(height: 20,),
                  Text('Chưa có đánh giá'),
                ],
              ),
            )

            // Container(
            //   padding: EdgeInsets.only(top: 80, left: 5, right: 5),
            //   //color: Colors.white,
            //   //      margin: EdgeInsets.symmetric(horizontal: 20),
            //   child:
            //
            //   rateItem?.length != null || rateItem?.length != 0 ?
            //     ListView.builder(
            //       itemCount: rateItem?.length,
            //       itemBuilder: (context, index) {
            //         return WidgetRateItem(
            //           star: rateItem[index].star,
            //           content: rateItem[index].content,
            //           author: rateItem[index].userParticipate,
            //           time: rateItem[index].time,
            //           ontap: (){
            //
            //           },
            //         );
            //       },
            //     ) : Center(child: Text('Chưa có đánh giá'))
            //
            //
            //
            //   // SingleChildScrollView(
            //   //   physics: BouncingScrollPhysics(),
            //   //   child:
            //   //   Column(
            //   //     crossAxisAlignment: CrossAxisAlignment.start,
            //   //     children: [
            //   //       WidgetRateItem(
            //   //         star: 5,
            //   //         content: "ok",
            //   //         author: mapUserItem[0],
            //   //         time: "24-06-2020",
            //   //         ontap: (){
            //   //
            //   //         },
            //   //       )
            //   //     ],
            //   //   ),
            //   // ),
            // )
          ],
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  _buildAppbar() => WidgetAppbarNotSearch(
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    title: AppLocalizations.of(context).translate('list_rate.title'),
    left: [WidgetAppbarMenuBack()],
  );


}
