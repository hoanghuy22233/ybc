import 'package:ybc/utils/dio/barrel_dio.dart';
import 'package:flutter/material.dart';

class WidgetScreenError extends StatelessWidget {
  final DioStatus status;
  final bool inScroll;

  const WidgetScreenError(
      {Key key, @required this.status, this.inScroll = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return inScroll
        ? Center(child: Text('${status.message}'))
        : Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [ListView(), Center(child: Text('${status.message}'))],
            ),
          );
  }
}
