
import 'package:flutter/material.dart';
class WidgetSubmitButton extends StatelessWidget {
  final String firstText, secondText;
  final Image secondIcon;
  final Color secondColor, firstColor;
  final Color firstTextColor, secondTextColor;
  final double spaceBetween;
  const WidgetSubmitButton({Key key, this.firstText, this.secondText, this.firstColor, this.secondIcon, this.secondColor, this.firstTextColor, this.secondTextColor, this.spaceBetween}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: firstColor,
            borderRadius:
            BorderRadius.circular(5),
          ),
          height: 30,
          width: 90,
          child: Text(
            firstText,
            style: TextStyle(
                color: firstTextColor),
          ),
        ),
        SizedBox(width: spaceBetween,),
        Container(
          alignment: Alignment.center,
          height: 30,
          width: 105,
          decoration: BoxDecoration(
            color: secondColor,
            borderRadius:
            BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment
                .spaceEvenly,
            children: [
              secondIcon,
              Text(
                secondText,
                style: TextStyle(
                    color:
                    secondTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

