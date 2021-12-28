import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/screen/forgot_pass/widget_forgot_password_form.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_account/widget_appbar_not_search.dart';
import 'package:ybc/utils/locale/app_localization.dart';
import 'package:ybc/utils/more/BHColors.dart';
import 'package:ybc/utils/more/BHConstants.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String tag = '/ForgotPasswordScreen';

  @override
  ForgotPasswordScreenState createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Container(
          child: Column(
            children: [
              _buildAppbar(AppLocalizations.of(context).translate('forgot_password.title')),
              Container(
                padding: EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: [
                    _buildImage(),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Text(BHForgotPasswordSubTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: BHAppTextColorSecondary, fontSize: 14)),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    _widgetForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _widgetForm() => WidgetForgotPasswordForm();

  _buildImage(){
    return GestureDetector(
      onTap: (){
        AppNavigator.navigateWorkService();
      },
      child: Tooltip(
        message: 'Về trang chủ',
        child: Padding(
          padding: const EdgeInsets.only( top: 20),
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
                "VDONE Startups",
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
