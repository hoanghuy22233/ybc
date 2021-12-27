import 'package:flutter/material.dart';

class WidgetSpacer extends StatelessWidget {
  final double _height;
  final double _width;

  WidgetSpacer({double height = 16, double width = 0})
      : this._height = height,
        this._width = width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
    );
  }
}
