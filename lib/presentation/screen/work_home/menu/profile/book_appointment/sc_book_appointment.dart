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
import 'widget_book_appointment_form.dart';

class BookAppointmentScreen extends StatefulWidget {
  BookAppointmentScreen({Key key, this.image, this.fullName}) : super(key: key);
  final String image;
  final String fullName;

  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildAppbar(),
          Container(
            padding: EdgeInsets.only(top: 90, left: 5, right: 5),
            //color: Colors.white,
            //      margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text('Chuyên gia', style: AppStyle.DEFAULT_MEDIUM_BOLD,)),
                SizedBox(height: 20),
                _buildInfo(),
                SizedBox(height: 20),
                Text('Phương thức hẹn', style: AppStyle.DEFAULT_MEDIUM,),
                SizedBox(height: 20),
                BookAppointmentForm(),
              ],
            )
          )
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  _buildAppbar() => WidgetAppbarNotSearch(
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    title: AppLocalizations.of(context).translate('book_appointment.title'),
    left: [WidgetAppbarMenuBack()],
  );

  _buildInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          margin: EdgeInsets.only(top: 5, left: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(widget.image),
          ),
        ),
        SizedBox(width: 10,),
        Text(widget.fullName)
      ],
    );
  }

}