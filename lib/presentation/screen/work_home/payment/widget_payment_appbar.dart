import 'package:flutter/material.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';

class WidgetPaymentAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WidgetAppbar(
        title: ('Thanh toán').toUpperCase(),
        left: [WidgetAppbarMenuBack()],
      ),
    );
  }
}
