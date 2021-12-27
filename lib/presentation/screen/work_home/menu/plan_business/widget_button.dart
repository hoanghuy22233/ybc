import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Widget image;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double width;
  final isEnable;

  const WidgetButton({Key key, this.onTap, this.text,this.height, this.isEnable, this.backgroundColor, this.width, this.image, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height != null ? height : AppValue.INPUT_FORM_HEIGHT,
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(5),
        color: isEnable
            ? backgroundColor
            : AppColor.BUTTON_DISABLE_COLOR,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: image != null ? Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 13),
                height: 10,
                width: 10,
                child: image,
              ),
            ) : SizedBox(),),
            SizedBox(width: 12,),
            Expanded(
              flex: 3,
              child: Text(
                text,
                style: textColor != null
                    ? AppStyle.DEFAULT_SMALL.copyWith(color: textColor)
                    : AppStyle.DEFAULT_SMALL.copyWith(color: AppColor.BLACK),
              ),
            )
          ],
        ),
      ),
    );
  }
}
