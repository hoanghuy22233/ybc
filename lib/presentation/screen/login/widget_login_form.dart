import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/screen/login/bloc/bloc.dart';
import 'package:ybc/utils/more/BHColors.dart';
import 'package:ybc/utils/more/BHConstants.dart';
import 'package:ybc/utils/snackbar/barrel_snack_bar.dart';
import 'package:ybc/utils/utils.dart';
import 'package:ybc/presentation/common_widgets/widget_dialog.dart';

import 'widget_social_button.dart';

class WidgetLoginForm extends StatefulWidget {
  @override
  _WidgetLoginFormState createState() => _WidgetLoginFormState();
}

class _WidgetLoginFormState extends State<WidgetLoginForm> {
  LoginBloc _loginBloc;
  UserRepository _userRepository;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscurePassword = true;
  bool autoValidate = false;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    //_updateLocationBloc = BlocProvider.of<UpdateLocationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }
        if (state.isSuccess) {
          GetSnackBarUtils.createSuccess(message: state.message);
          FocusScope.of(context).unfocus();
          AppNavigator.navigateWorkService();
        }
        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
          setState(() {
            autoValidate = true;
          });
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
          child: Form(
            child: Column(
              children: [
                _buildTextFieldUsername(),
                WidgetSpacer(
                  height: 10,
                ),
                _buildTextFieldPassword(),
                WidgetSpacer(
                  height: 20,
                ),
                _buildButtonLogin(state),
                SizedBox(
                  height: 10,
                ),
                _buildButtonRegister(),
                SizedBox(
                  height: 20,
                ),
                _buildForgotPassword(),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }


  _buildForgotPassword(){
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: GestureDetector(
          onTap: () {
            // BHForgotPasswordScreen().launch(context);
            AppNavigator.navigateForgotPass();
          },
          child: Text(BHTxtForgetPwd,
              style: TextStyle(
                  color: BHAppTextColorSecondary, fontSize: 12)),
        ),
      ),
    );
  }

  _buildButtonLogin(LoginState state) {
    return WidgetLoginButton(
      onTap: () {
        if(isPopulated){
          if (_passwordController.text.trim().length < 6) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return WidgetDialog(
                    title: 'Lỗi',
                    content: "Mật khẩu phải chứa ít nhất 6 kí tự!",
                    action1: (){
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                    },
                    colorButton1: Colors.red,
                    titleAction1: 'OK',
                  );
                });
          }
          else {
            _loginBloc.add(LoginSubmitUsernamePasswordEvent(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
              lat: 21.007353.toString(),
              long: 105.781346.toString(),
            ));
            FocusScope.of(context).unfocus();
          }
        }
        else{
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return WidgetDialog(
                  title: 'Thiếu thông tin',
                  image: 'assets/icons/warning.png',
                  content: "Bạn chưa nhập đầy đủ thông tin!",
                  action1: (){
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  },
                  colorButton1: Colors.red,
                  titleAction1: 'OK',
                );
              });
        }
      },
      height: 50,
      backgroundColor: Colors.blue,
      isEnable: !isLoginButtonEnabled(),
      text: AppLocalizations.of(context).translate('login.title'),
    );
  }

  _buildButtonRegister() {
    return GestureDetector(
      onTap: () => AppNavigator.navigateRegister(),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width - 50,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.transparent,
            border: Border.all(color: Colors.blue, width: 2)),
        child: Text(AppLocalizations.of(context).translate('login.register'),
            style: TextStyle(
                color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold)),
      ),
    );
  }

  bool isLoginButtonEnabled() {
    return _loginBloc.state.isFormValid &&
        isPopulated &&
        !_loginBloc.state.isSubmitting;
  }

  _buildTextFieldPassword() {
    return WidgetLoginInput(
      autovalidate: autoValidate,
      inputController: _passwordController,
      onChanged: (value) {
        _loginBloc.add(LoginPasswordChanged(password: value));
      },
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('login.password_invalid')),
      hint: AppLocalizations.of(context).translate('login.password_hint'),
      obscureText: obscurePassword,
      endIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscurePassword = !obscurePassword;
          });
        },
        child: Icon(
            obscurePassword
                ? MaterialCommunityIcons.eye_outline
                : MaterialCommunityIcons.eye_off_outline,
            color: AppColor.GREY,
            size: 20
        ),

      ),
    );
  }

  _buildTextFieldUsername() {
    return WidgetLoginInput(
      inputType: TextInputType.emailAddress,
      autovalidate: autoValidate,
      inputController: _emailController,
      onChanged: (value) {
        _loginBloc.add(LoginUsernameChanged(email: value));
      },
      validator: AppValidation.validateUserName(
          AppLocalizations.of(context).translate('login.username_invalid')),
      hint: AppLocalizations.of(context).translate('login.username_hint'),
      endIcon: GestureDetector(
        onTap: () {
          this._emailController.clear();
        },
        child: Icon(Icons.highlight_remove, color: Colors.grey, size: 20),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
