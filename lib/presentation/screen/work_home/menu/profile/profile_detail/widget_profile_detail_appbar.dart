import 'package:flutter/material.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/utils/locale/app_localization.dart';

class WidgetProfileDetailAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WidgetAppbar(
        title: AppLocalizations.of(context)
            .translate('profile_detail.title')
            .toUpperCase(),
        left: [WidgetAppbarMenuBack()],
      ),
    );
  }
}
