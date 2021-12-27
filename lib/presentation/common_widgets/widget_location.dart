import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:flutter/material.dart';

class WidgetLocation extends StatelessWidget {
  final String text;
  final Function onTap;

  const WidgetLocation({Key key, this.text, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: AppStyle.DEFAULT_MEDIUM,
            ),
          )),
    );
  }
}
