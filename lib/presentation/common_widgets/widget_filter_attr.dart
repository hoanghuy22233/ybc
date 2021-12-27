import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:flutter/material.dart';

class WidgetFilterAttr extends StatelessWidget {
  final String text;
  final bool isChoose;
  final onTap;

  const WidgetFilterAttr({Key key, this.text, this.isChoose, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
//        color: isChoose ? AppColor.THIRD_COLOR : AppColor.GREY_LIGHTER_3,
        color: isChoose ? Colors.black : AppColor.GREY_LIGHTER_3,
        child: Center(
          child: Text(text, style: isChoose ? AppStyle.DEFAULT_SMALL.copyWith(
              color: AppColor.WHITE) :  AppStyle.DEFAULT_SMALL.copyWith(
              color: AppColor.BLACK), textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
