import 'package:flutter/material.dart';

class WidgetCircleAvatar extends StatelessWidget {
  final Widget image;
  final Color backgroundColor;
  final EdgeInsets padding;
  final double border;
  const WidgetCircleAvatar({Key key, this.image, this.backgroundColor, this.padding, this.border=0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(500),
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor ?? null,
            borderRadius:BorderRadius.circular(500),
            border: Border.all(color: Colors.white, width: this.border)
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.all(0.0),
          child: AspectRatio(
            aspectRatio: 1,
            child: image,
          ),
        ),
      ),
    );
  }
}
