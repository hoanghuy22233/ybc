import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ybc/app/auth_bloc/authentication_bloc.dart';
import 'package:ybc/app/auth_bloc/authentication_state.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/app/constants/preferences/app_preferences.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu.dart';
import 'package:ybc/presentation/common_widgets/widget_dialog.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_bloc.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_event.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_state.dart';
import 'package:ybc/utils/dialog/get_dialog_utils.dart';
import 'package:ybc/utils/handler/with_auth.dart';
import 'package:ybc/utils/locale/app_localization.dart';

class WidgetCartAppBarMenu extends StatefulWidget {
  @override
  _WidgetCartAppBarMenuState createState() => _WidgetCartAppBarMenuState();
}

class _WidgetCartAppBarMenuState extends State<WidgetCartAppBarMenu> {

  @override
  void initState() {
    BlocProvider.of<CartBloc>(context).add(RefreshCart());
    super.initState();
  }

  bool isLogin = false;
  void openLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSelectedCountry = prefs.containsKey(AppPreferences.LOGIN);
    isLogin = isSelectedCountry;
  }

  @override
  Widget build(BuildContext context) {
    openLogin();
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return WidgetAppbarMenu(
          icon: Container(
            height: 40,
            width: 40,
            child: Lottie.asset(
              'assets/lottie/lf30_editor_1punzcxk.json',
            ),
          ),
          onTap: () {
            WithAuth.isAuth(ifNotAuth: () {
              if (isLogin) {
                //AppNavigator.navigateLogin();
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return WidgetDialog(
                        title: 'Lỗi',
                        content: "Vui lòng đăng nhập để sử dụng tính năng này.",
                        image: 'assets/icons/warning.png',

                        action2: (){
                          AppNavigator.navigateBack();
                        },
                        colorButton2: Colors.blue,
                        titleAction2: 'Trở về',

                        action1: (){
                          AppNavigator.navigateBack();
                          AppNavigator.navigateLogin();
                        },
                        colorButton1: Colors.blue,
                        titleAction1: 'Đăng nhập',

                      );
                    });
              }
            }, ifAuth: () {
              AppNavigator.navigateCart();
            });
          },
          badge: state.carts != null ? state.carts.length : 0,
        );
      },
    );
  }
}
