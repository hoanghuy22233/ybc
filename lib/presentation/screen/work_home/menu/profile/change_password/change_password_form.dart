import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/string/validator.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/presentation/common_widgets/widget_dialog.dart';
import 'package:ybc/presentation/common_widgets/widget_input.dart';
import 'package:ybc/presentation/common_widgets/widget_login_button.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/utils/locale/app_localization.dart';
import 'package:ybc/utils/snackbar/get_snack_bar_utils.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/app/auth_bloc/authentication_bloc.dart';
import 'package:ybc/app/auth_bloc/authentication_event.dart';
import 'package:lottie/lottie.dart';

import 'bloc/bloc.dart';

class WidgetChangePasswordForm extends StatefulWidget {
  final String email;

  const WidgetChangePasswordForm({Key key, @required this.email}) : super(key: key);
  @override
  _WidgetChangePasswordFormState createState() =>
      _WidgetChangePasswordFormState();
}

class _WidgetChangePasswordFormState extends State<WidgetChangePasswordForm> {
  ChangePasswordBloc _changePasswordBloc;

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureRePassword = true;

  bool get isPopulated => _oldPasswordController.text.isNotEmpty && _newPasswordController.text.isNotEmpty&& _confirmNewPasswordController.text.isNotEmpty;



  @override
  void initState() {
    super.initState();
    _changePasswordBloc = BlocProvider.of<ChangePasswordBloc>(context);
    _oldPasswordController.addListener(_onOldPasswordChange);
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _oldPasswordController.text = widget.email;
      });
    });

    _newPasswordController.addListener(_onNewPasswordChange);
    _confirmNewPasswordController.addListener(_onConfirmNewPasswordChange);
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordBloc, ChangePasswordState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }
        if (state.isSuccess) {
          await GetSnackBarUtils.createSuccess(message: state.message);
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());

          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Lottie.asset(
                        'assets/lottie/trail_loading.json',
                      ),
                    ),
                  ),
                );
              });
          Future.delayed(Duration(seconds: 1), () {
            AppNavigator.navigateWorkService();
          });
        }

        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
        }
      },
      child: BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(top: 20),
            child: Form(
              child: Column(
                children: [
                  _buildTextFieldOldPassword(),
                  WidgetSpacer(
                    height: 10,
                  ),
                  _buildTextFieldNewPassword(),
                  WidgetSpacer(
                    height: 10,
                  ),
                  _buildTextFieldConfirmNewPassword(),
                  WidgetSpacer(
                    height: 20,
                  ),
                  _buildButtonForgotPassword(state),

                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool isForgotPasswordButtonEnabled() {
    return _changePasswordBloc.state.isFormValid &&
        isPopulated &&
        !_changePasswordBloc.state.isSubmitting;
  }

  _buildButtonForgotPassword(ChangePasswordState state) {
    return WidgetLoginButton(
      onTap: () {
        if(isPopulated){
          if (_oldPasswordController.text.trim().length < 6
              || _newPasswordController.text.trim().length < 6
              || _confirmNewPasswordController.text.trim().length < 6) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: Text("Lỗi", style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: Colors.red, fontSize: 16),),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: 60,
                              width: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset('assets/icons/warning.png'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(child: Text('Mật khẩu phải chứa ít nhất 6 kí tự!', style: AppStyle.DEFAULT_SMALL_BOLD.copyWith(color: Colors.black), )),
                        ],
                      ),
                    ),
                    actions: [
                      RaisedButton(
                          child: Text("OK"),
                          color: Colors.red,
                          onPressed: (){
                            Navigator.of(context, rootNavigator: true).pop('dialog');
                          }
                      ),
                    ],
                  );
                });
          }
          else{
            if(_newPasswordController.text.trim() != _confirmNewPasswordController.text.trim()){
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return
                      WidgetDialog(
                        title: "Lỗi",
                        content: "Mật khẩu nhập lại không trùng khớp! Vui lòng kiểm tra lại.",
                        titleAction1: "OK",
                        colorButton1: Colors.blue,
                        action1: (){
                          Navigator.of(context, rootNavigator: true).pop('dialog');
                        },
                      );
                    //   AlertDialog(
                    //   scrollable: true,
                    //   title: Text("Lỗi", style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: Colors.red, fontSize: 16),),
                    //   content: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Center(child: Text("Mật khẩu nhập lại không trùng khớp! Vui lòng kiểm tra lại.", style: AppStyle.DEFAULT_SMALL_BOLD.copyWith(color: Colors.black), textAlign: TextAlign.center,)),
                    //   ),
                    //   actions: [
                    //     RaisedButton(
                    //         child: Text("OK"),
                    //         color: Colors.blue,
                    //         onPressed: (){
                    //           Navigator.of(context, rootNavigator: true).pop('dialog');
                    //         }
                    //     ),
                    //   ],
                    // );
                  });
            }
            else {
              if (isForgotPasswordButtonEnabled()) {
                _changePasswordBloc.add(
                    ChangePasswordSubmitted(
                      oldPassword: _oldPasswordController.text.trim(),
                      newPassword: _newPasswordController.text.trim(),
                    )
                );
                FocusScope.of(context).unfocus();
              }
            }
          }
        }
        else{
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  title: Text("Thiếu thông tin", style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: Colors.red, fontSize: 16),),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 60,
                            width: 60,
                            child: GestureDetector(
                              onTap: (){

                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset('assets/icons/warning.png'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(child: Text("Bạn chưa nhập đầy đủ thông tin!", style: AppStyle.DEFAULT_SMALL_BOLD.copyWith(color: Colors.black), )),
                      ],
                    ),
                  ),
                  actions: [
                    RaisedButton(
                        child: Text("OK"),
                        color: Colors.red,
                        onPressed: (){
                          Navigator.of(context, rootNavigator: true).pop('dialog');
                        }
                    ),
                  ],
                );
              });
        }
      },
      isEnable: !isForgotPasswordButtonEnabled(),
      height: 45,
      backgroundColor: Colors.blue,
      text: AppLocalizations.of(context).translate('change_password.update'),
    );
  }


  _buildTextFieldOldPassword() {
    return WidgetInput(
      inputType: TextInputType.text,
      inputController: _oldPasswordController,
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('change_password.current_password_invalid')),
      autovalidate: false,
      hint: AppLocalizations.of(context).translate('change_password.current_password'),
      labelText: AppLocalizations.of(context).translate('change_password.current_password'),
      endIcon: GestureDetector(
        onTap: (){
          this._oldPasswordController.clear();
        },
        child: Icon(Icons.highlight_remove,
            color: Colors.grey,
            size: 20),
      ),
      leadIcon: Image.asset("assets/icons/lock.png", fit: BoxFit.fill,color: Colors.grey,),
    );
  }

  _buildTextFieldNewPassword() {
    return WidgetInput(
      inputType: TextInputType.text,
      inputController: _newPasswordController,
      obscureText: obscurePassword,
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('change_password.new_password_invalid')),
      autovalidate: false,
      hint: AppLocalizations.of(context).translate('change_password.new_password'),
      labelText: AppLocalizations.of(context).translate('change_password.new_password'),
      endIcon: GestureDetector(
        onTap: (){
          setState(() {
            obscurePassword = !obscurePassword;
          });
        },
        child: Icon(
          obscurePassword
              ? MaterialCommunityIcons.eye_outline
              : MaterialCommunityIcons.eye_off_outline,
          color: AppColor.GREY,
          size: 20,
        ),
      ),
      leadIcon: Image.asset("assets/icons/lock.png", fit: BoxFit.fill,color: Colors.grey,),
    );
  }

  _buildTextFieldConfirmNewPassword() {
    return WidgetInput(
      inputType: TextInputType.text,
      inputController: _confirmNewPasswordController,
      obscureText: obscureRePassword,
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('change_password.confirm_new_password_hint')),
      autovalidate: false,
      hint: AppLocalizations.of(context).translate('change_password.confirm_new_password'),
      labelText: AppLocalizations.of(context).translate('change_password.new_password'),
      endIcon: GestureDetector(
        onTap: (){
          setState(() {
            obscureRePassword = !obscureRePassword;
          });
        },
        child: Icon(
          obscureRePassword
              ? MaterialCommunityIcons.eye_outline
              : MaterialCommunityIcons.eye_off_outline,
          color: AppColor.GREY,
          size: 20,
        ),
      ),
      leadIcon: Image.asset("assets/icons/lock.png", fit: BoxFit.fill,color: Colors.grey,),
    );
  }

  void _onOldPasswordChange() {
    _changePasswordBloc.add(OldPasswordChanged(
      oldPassword: _oldPasswordController.text,
    ));
  }

  void _onNewPasswordChange() {
    _changePasswordBloc.add(NewPasswordChanged(
      newPassword: _newPasswordController.text,
    ));
  }

  void _onConfirmNewPasswordChange() {
      _changePasswordBloc.add(ConfirmNewPasswordChanged(
        confirmNewPassword: _confirmNewPasswordController.text,
      ));
    }

}
