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
import 'widget_rate_form.dart';

class RateUserScreen extends StatefulWidget {
  RateUserScreen({Key key, this.title, this.image, this.fullName}) : super(key: key);
  final String title;
  final String image;
  final String fullName;

  @override
  _RateUserScreenState createState() => _RateUserScreenState();
}

class _RateUserScreenState extends State<RateUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            _buildAppbar(),
            Container(
              padding: EdgeInsets.only(top: 15, left: 5, right: 5),
              //color: Colors.white,
              //      margin: EdgeInsets.symmetric(horizontal: 20),
              child: WidgetRateUserForm(image: widget.image, fullName: widget.fullName)
            )
          ],
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  _buildAppbar() => WidgetAppbarNotSearch(
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    title: AppLocalizations.of(context).translate('rate_user.title'),
    left: [WidgetAppbarMenuBack()],
  );


}
