import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';

class WidgetItemProfile extends StatefulWidget {
  final String left;
  final String right;
  final Function ontap;

  WidgetItemProfile(
      {Key key,
      this.left,
      this.right = '',
      this.ontap
      })
      : super(key: key);

  @override
  _WidgetItemProfileState createState() => _WidgetItemProfileState();
}

class _WidgetItemProfileState extends State<WidgetItemProfile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50)
        ),
        //padding: EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          elevation: 0,
          shape: StadiumBorder(
            side: BorderSide(
              color: Colors.transparent,
              width: 1.0,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(widget.left, style: AppStyle.DEFAULT_SMALL,),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(widget.right, style: AppStyle.DEFAULT_SMALL, textAlign: TextAlign.right,),
              ),
              Expanded(
                flex: 1,
                child: Icon(Icons.chevron_right_outlined, color: Colors.black,),
              ),
            ],
          ),
        ),
      ),
    );
  }

}


