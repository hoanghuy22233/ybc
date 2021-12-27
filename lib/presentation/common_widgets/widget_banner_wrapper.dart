import 'package:flutter/material.dart';

class WidgetBannerWrapper extends StatelessWidget {
  final Widget child;

  WidgetBannerWrapper({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: MediaQuery.of(context).size.height /
            MediaQuery.of(context).size.width,
        child: child,
      ),
    );
  }
}
