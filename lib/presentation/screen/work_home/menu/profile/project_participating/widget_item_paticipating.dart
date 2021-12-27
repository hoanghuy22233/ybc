import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';

class WidgetItemParticipating extends StatefulWidget {
  final String image;
  final String title;
  final Function ontap;

  WidgetItemParticipating(
      {Key key,
      this.image = 'assets/images/ybc.png',
      this.title,
      this.ontap
      })
      : super(key: key);

  @override
  _WidgetItemParticipatingState createState() => _WidgetItemParticipatingState();
}

class _WidgetItemParticipatingState extends State<WidgetItemParticipating> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(top: 5, left: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(widget.image),
                    // child: Image.network(state?.user?.image ??
                    //     'https://picsum.photos/250?image=9', fit: BoxFit.fill,),
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Text(widget.title, style: AppStyle.DEFAULT_MEDIUM_BOLD,)
              ),
              Expanded(
                flex: 1,
                child: Text('Chi tiết', style: AppStyle.DEFAULT_VERY_SMALL.copyWith(color: Colors.blue, decoration: TextDecoration.underline,), ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}


