import 'package:flutter/material.dart';

class WidgetRadioItem extends StatelessWidget {
  final Widget hintItem;
  final Widget radioArea;
  final Widget radio;
  final CrossAxisAlignment crossAxisAlignment;

  WidgetRadioItem({Key key, this.hintItem, this.radio, this.radioArea, this.crossAxisAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
      mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.end,
        children: [
          Stack(
            children: [ radioArea,radio ?? SizedBox(),],
          ),
          SizedBox(
            width: hintItem != null ? 4 : 0,
          ),
          hintItem ?? SizedBox(),
        ],
      ),
    );
  }
}
