import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:flutter/material.dart';

class WidgetElevationDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: new BoxDecoration(
        color: AppColor.GREY,
        boxShadow: [
          BoxShadow(
            color: AppColor.GREY,
            blurRadius: 15.0, // has the effect of softening the shadow
            spreadRadius: 2.0, // has the effect of extending the shadow
            offset: Offset(
              0.0, // horizontal, move right 10
              -2.0, // vertical, move down 10
            ),
          )
        ],
        borderRadius: new BorderRadius.all(Radius.circular(0.0)),
      ),
    );
  }
}
