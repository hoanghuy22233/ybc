import 'package:ybc/app/auth_bloc/authentication_bloc.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/repo/barrel_repo.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/common_widgets/widget_touch_hide_keyboard.dart';

import 'package:ybc/presentation/screen/login/barrel_login.dart';
import 'package:ybc/presentation/screen/login/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_account/widget_appbar_not_search.dart';
import 'package:ybc/utils/locale/app_localization.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    return WidgetTouchHideKeyBoard(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => LoginBloc(
              userRepository: userRepository,
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
          child: SafeArea(
            top: true,
            child: Container(
              child: Column(
                children: [
                  _buildAppbar(AppLocalizations.of(context).translate('login.title')),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildImage(),
                          _buildLoginForm(),

                        ],
                      ),
                    ),
                  ),
                  _buildBottomRegister(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  _buildImage(){
    return GestureDetector(
      onTap: (){
        AppNavigator.navigateWorkService();
      },
      child: Tooltip(
        message: 'Về trang chủ',
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
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

  _buildLoginForm() => WidgetLoginForm();

  _buildBottomRegister() => WidgetBottomRegister();

  Widget _buildAppbar(String title) => WidgetAppbarNotSearch(
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    left: [
      WidgetAppbarMenuBack(),
    ],
    title: title,
  );
}
