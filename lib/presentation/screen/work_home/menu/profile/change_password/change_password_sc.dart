import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/screen/forgot_pass/widget_forgot_password_form.dart';
import 'package:ybc/presentation/screen/forgot_pass_reset/widget_forgot_password_reset_form.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/change_password/change_password_form.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_account/widget_appbar_not_search.dart';
import 'package:ybc/utils/locale/app_localization.dart';


class ChangePasswordScreen extends StatefulWidget {
  @override
  ChangePasswordScreenState createState() => ChangePasswordScreenState();
}

class ChangePasswordScreenState extends State<ChangePasswordScreen> {
    @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Container(
          child: Column(
            children: [
              _buildAppbar(AppLocalizations.of(context).translate('change_password.title')),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start ,
                      children: [
                        _buildImage(),
                        SizedBox(
                          height: 25,
                        ),
                        Text(AppLocalizations.of(context).translate('change_password.message'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black, fontSize: 15)),
                        SizedBox(
                          height: 25,
                        ),
                        _widgetFormReset(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _widgetFormReset() => WidgetChangePasswordForm();

  _buildImage(){
      return GestureDetector(
        onTap: (){
          AppNavigator.navigateWorkService();
        },
        child: Tooltip(
          message: 'Về trang chủ',
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 0),
            child: Row(
              children: [
                Image.asset("assets/images/ybc.png",
                    //  color: Colors.white.withOpacity(0.8),
                    height: 70,
                    width: 70),
                SizedBox(
                  width: 25,
                ),
                Text(
                  "YBC Startups",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                      fontFamily: 'Righteous'),
                ),
              ],
            ),
          ),
        ),
      );
    }

  Widget _buildAppbar(String title) => WidgetAppbarNotSearch(
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    //height: 80,
    left: [
      WidgetAppbarMenuBack(),
    ],
    title: title,
  );
}
