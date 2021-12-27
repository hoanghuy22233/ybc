import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';

class WidgetLoginButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color backgroundColor;
  final double height;
  final isEnable;

  const WidgetLoginButton({Key key, this.onTap, this.text,this.height, this.isEnable, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-40,
      height: height.toString() != null ? height : 30,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: isEnable
              ? AppColor.BUTTON_DISABLE_COLOR
              : backgroundColor,
          child: Center(
              child: Text(
            text,
            style: isEnable
                ? AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.BLACK)
                : AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.WHITE),
          )),
        ),
      ),
    );
  }
}
