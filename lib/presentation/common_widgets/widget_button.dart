import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';

class WidgetButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color backgroundColor;
  final double height;

  const WidgetButton({Key key, this.onTap, this.text,this.height, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height.toString() != null ? height : 30,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: backgroundColor ?? Colors.blue,
          child: Center(
              child: Text(
            text,
            style: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.WHITE),
          )),
        ),
      ),
    );
  }
}
