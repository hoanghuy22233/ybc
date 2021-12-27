import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/common_widgets/widget_touch_hide_keyboard.dart';
import 'package:ybc/presentation/screen/register/widget_register_form.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_account/widget_appbar_not_search.dart';
import 'package:ybc/utils/locale/app_localization.dart';

import 'bloc/bloc.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    return WidgetTouchHideKeyBoard(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => RegisterBloc(userRepository: userRepository),
          child: SafeArea(
            top: true,
            child: Column(
              children: [
                _buildAppbar(AppLocalizations.of(context).translate('register.title')),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          _buildImage(),
                          _buildRegisterForm(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  _buildImage(){
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Image.asset("assets/images/ybc.png",
                  //  color: Colors.white.withOpacity(0.8),
                  height: 70,
                  width: 70),
              SizedBox(width: 25,),
              Text("YBC Startups", style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontFamily: 'Righteous'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildRegisterForm() => WidgetRegisterForm();

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


