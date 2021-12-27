import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';

class WidgetAppbarMenuBack extends StatelessWidget {
  final Function onTap;
  final Color color;
  final Color backgroundColor;

  const WidgetAppbarMenuBack({Key key, this.onTap, this.color, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            left: AppValue.ACTION_BAR_HEIGHT * 0.2, top: 15),
        height: 25,
        width: 25,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: backgroundColor ?? Colors.grey[100]),
        child: WidgetAppbarMenu(
          icon: Image.asset(
            'assets/icons/ic_back.png',
            color: color != null ? color : Colors.black,
          ),
          onTap: onTap ??
              () {
            print('back screen');
                AppNavigator.navigateBack();
              },
        ));
  }
}
