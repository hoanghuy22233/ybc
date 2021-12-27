import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class WidgetRefresherLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppValue.REFRESHER_CONTAINER_VIEW_HEIGHT,
      height: AppValue.REFRESHER_CONTAINER_VIEW_WIDTH,
      child: Center(
        child: WidgetCircleProgress(),
      ),
    );
  }
}
