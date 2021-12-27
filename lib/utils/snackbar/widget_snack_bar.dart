import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:flutter/material.dart';

class WidgetSnackBar extends StatelessWidget {
  final String title;
  final String message;
  final Widget icon;

  const WidgetSnackBar({Key key, this.title, this.message, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Wrap(
            direction: Axis.vertical,
            children: [
              Text(
                title,
                style: AppStyle.DEFAULT_MEDIUM,
              ),
              message != null
                  ? Text(
                      message,
                      style: AppStyle.DEFAULT_MEDIUM,
                      overflow: TextOverflow.fade,
                    )
                  : SizedBox(),
            ],
          ),
          icon != null ? icon : SizedBox(),
        ],
      ),
    );
  }
}
