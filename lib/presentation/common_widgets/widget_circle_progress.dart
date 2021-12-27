import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:flutter/material.dart';

class WidgetCircleProgress extends StatelessWidget {
  final Color backgroundColor;
  final Color valueColor;

  const WidgetCircleProgress({Key key, this.backgroundColor, this.valueColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        height: 40,
        padding: EdgeInsets.all(5),
        child: CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(valueColor ?? AppColor.PRIMARY_COLOR),
          backgroundColor: backgroundColor ?? Colors.grey,
        ));
  }
}
