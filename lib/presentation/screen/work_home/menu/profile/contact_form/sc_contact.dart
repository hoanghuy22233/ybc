import 'package:flutter/material.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/model/entity_offline/bank_name.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/contact_form/widget_contact_form.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_account/widget_appbar_not_search.dart';
import 'package:ybc/presentation/screen/work_home/payments/widget_bank_item.dart';
import 'package:ybc/utils/locale/app_localization.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              _buildAppbar(AppLocalizations.of(context).translate('register_contact.title')),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height-140,
                  child: WidgetContactForm(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppbar(String title) => WidgetAppbarNotSearch(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        left: [
          WidgetAppbarMenuBack(),
        ],
        title: title,
      );
}
