import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/entity_offline/work/mapUser.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/project_participating/widget_item_paticipating.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/widget_dialog_infor_account.dart';
import 'package:ybc/utils/locale/app_localization.dart';

class WidgetRateItem extends StatefulWidget {
  final String content;
  final int star;
  final MapUserItem author;
  final String time;
  final Function ontap;

  WidgetRateItem(
      {Key key,
      this.content,
      this.star,
      this.ontap,
      this.time,
      this.author
    })
    : super(key: key);

  @override
  _WidgetRateItemState createState() => _WidgetRateItemState();
}

class _WidgetRateItemState extends State<WidgetRateItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmoothStarRating(
                allowHalfRating: false,
                onRated: (v) {
                },
                starCount: widget.star,
                rating: 5,
                size: 15.0,
                isReadOnly:true,
                color: Colors.amber,
                borderColor: Colors.amber,
                spacing:0.0
            ),
            SizedBox(
              height: 10,
            ),
            Text(widget.content, style: AppStyle.DEFAULT_MEDIUM.copyWith(color: Colors.black), ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(widget.time, style: AppStyle.DEFAULT_SMALL.copyWith(color: Colors.black), ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return WidgetDialogInfo(
                        title: AppLocalizations.of(context).translate('list_rate.info_account'),
                        image: widget.author.image,
                        job: widget.author.job,
                        position: widget.author.position,
                        fullName: widget.author.name,
                        isExpert: widget.author.isExpert,
                      );
                    });
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Được đánh giá bởi', style: AppStyle.DEFAULT_VERY_SMALL.copyWith(color: Colors.blue, decoration: TextDecoration.underline,), ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(widget.author.image),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }

  _openPopup(context) {


    // Alert(
    //     context: context,
    //     title: "LOGIN",
    //
    //     content: Column(
    //       children: <Widget>[
    //         TextField(
    //           decoration: InputDecoration(
    //             icon: Icon(Icons.account_circle),
    //             labelText: 'Username',
    //           ),
    //         ),
    //         TextField(
    //           obscureText: true,
    //           decoration: InputDecoration(
    //             icon: Icon(Icons.lock),
    //             labelText: 'Password',
    //           ),
    //         ),TextField(
    //           decoration: InputDecoration(
    //             icon: Icon(Icons.account_circle),
    //             labelText: 'Username',
    //           ),
    //         ),
    //         TextField(
    //           obscureText: true,
    //           decoration: InputDecoration(
    //             icon: Icon(Icons.lock),
    //             labelText: 'Password',
    //           ),
    //         ),
    //       ],
    //     ),
    //     buttons: [
    //       DialogButton(
    //         onPressed: () => Navigator.pop(context),
    //         child: Text(
    //           "LOGIN",
    //           style: TextStyle(color: Colors.blue, fontSize: 20),
    //         ),
    //       )
    //     ]).show();
  }
}


