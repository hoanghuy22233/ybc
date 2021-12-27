import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';

class WidgetAppbarMenuBackNewsDetail extends StatelessWidget {
  final Function onTap;
  final Color color;

  const WidgetAppbarMenuBackNewsDetail({Key key, this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            left: AppValue.ACTION_BAR_HEIGHT * 0.2, top: 20),
        height: 25,
        width: 25,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.grey[100]),
        child: WidgetAppbarMenu(
          icon: Image.asset(
            'assets/icons/ic_back.png',
            color: color != null ? color : Colors.black,
          ),
          onTap: onTap ??
              () {
                AppNavigator.popToNews();
              },
        ));
  }
}
