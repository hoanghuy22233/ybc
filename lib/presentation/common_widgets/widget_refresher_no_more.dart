import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:flutter/material.dart';

class WidgetRefresherNoMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.red,
      width: AppValue.REFRESHER_CONTAINER_VIEW_HEIGHT * 2,
      height: AppValue.REFRESHER_CONTAINER_VIEW_WIDTH * 2,
      child: Center(
        child: Text('No more data!'),
      ),
    );
  }
}
