import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class WidgetWorkTitle extends StatelessWidget {
  final String title;

  const WidgetWorkTitle({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: HtmlWidget(
          title,
        ),
      ),
      Positioned(
        top: 10,
        left: 10,
        child: Container(
          height: 10,
          width: 5,
          color: Colors.blue,
        ),
      )
    ]);
  }
}
