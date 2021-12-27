import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/book_appointment/sc_book_appointment.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/rate_user/sc_rate_user.dart';
import 'package:ybc/utils/locale/app_localization.dart';

class WidgetDialogInfo extends StatefulWidget {
  final String image;
  final String title;
  final String fullName, position ,job;
  final Function rate;
  final Function appointment;
  final bool isExpert;

  WidgetDialogInfo(
      {Key key,
      this.image = 'assets/images/ybc.png',
      this.fullName, this.position, this.job, this.isExpert=false, this.title, this.rate, this.appointment
      })
      : super(key: key);

  @override
  _WidgetDialogInfoState createState() => _WidgetDialogInfoState();
}

class _WidgetDialogInfoState extends State<WidgetDialogInfo> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(widget.title, style: AppStyle.DEFAULT_MEDIUM_BOLD,),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                height: 60,
                width: 60,
                child: GestureDetector(
                  onTap: (){

                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(widget.image),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(child: Text(widget.fullName, style: AppStyle.DEFAULT_SMALL_BOLD.copyWith(color: Colors.black), )),
            SizedBox(
              height: 30,
            ),
            Text('Chức vụ: ${widget.position}', style: AppStyle.DEFAULT_SMALL.copyWith(color: Colors.black), ),
            SizedBox(
              height: 10,
            ),
            Text('Nghề nghiệp: ${widget.job}', style: AppStyle.DEFAULT_SMALL.copyWith(color: Colors.black), ),
          ],
        ),
      ),
      actions: [
        widget.isExpert ? RaisedButton(
            child: Text("Đặt lịch"),
            color: Colors.red,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookAppointmentScreen(image: widget.image,fullName: widget.fullName,)),
              );
            }
        ) : SizedBox(),
        RaisedButton(
            child: Text("Đánh giá"),
            color: Colors.blue,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RateUserScreen(image: widget.image,fullName: widget.fullName,)),
              );
            }
        )
      ],
    );
  }

}


