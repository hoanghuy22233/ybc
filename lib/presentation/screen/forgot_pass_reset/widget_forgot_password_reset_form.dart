import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/string/validator.dart';
import 'package:ybc/presentation/common_widgets/widget_input.dart';
import 'package:ybc/presentation/common_widgets/widget_login_button.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/forgot_pass_reset/widget_resend_otp.dart';
import 'package:ybc/utils/locale/app_localization.dart';
import 'package:ybc/utils/snackbar/get_snack_bar_utils.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/app/constants/barrel_constants.dart';

import 'bloc/bloc.dart';

class WidgetForgotPasswordResetForm extends StatefulWidget {
  final String email;

  const WidgetForgotPasswordResetForm({Key key, @required this.email}) : super(key: key);
  @override
  _WidgetForgotPasswordResetFormState createState() =>
      _WidgetForgotPasswordResetFormState();
}

class _WidgetForgotPasswordResetFormState extends State<WidgetForgotPasswordResetForm> {
  ForgotPasswordResetBloc _forgotPasswordResetBloc;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();
  final TextEditingController _OTPController = TextEditingController();

  bool obscurePassword = true;
  bool obscureRePassword = true;

  bool get isPopulated => _newPasswordController.text.isNotEmpty && _OTPController.text.isNotEmpty&& _confirmNewPasswordController.text.isNotEmpty;



  @override
  void initState() {
    super.initState();
    _forgotPasswordResetBloc = BlocProvider.of<ForgotPasswordResetBloc>(context);
    _emailController.addListener(_onEmailChange);
    // Future.delayed(Duration(milliseconds: 500), () {
    //   setState(() {
    //     _emailController.text = widget.email;
    //   });
    // });

    _newPasswordController.addListener(_onNewPasswordChange);
    _OTPController.addListener(_onOTPChange);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _newPasswordController.dispose();
    _OTPController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordResetBloc, ForgotPasswordResetState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }
        if (state.isSuccess) {
          await GetSnackBarUtils.createSuccess(message: state.message);
          // AppNavigator.navigateForgotPassVerify(
          //     email: _emailController.text);
          AppNavigator.navigateLogin();
          // showAlertDialog(context);
        }

        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
        }
      },
      child: BlocBuilder<ForgotPasswordResetBloc, ForgotPasswordResetState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(top: 20),
            child: Form(
              child: Column(
                children: [

                  _buildTextFieldNewPassword(),
                  WidgetSpacer(
                    height: 10,
                  ),
                  _buildTextFieldConfirmNewPassword(),
                  WidgetSpacer(
                    height: 10,
                  ),
                  _buildTextFieldOTP(),
                  _buildResend(),
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
    return _forgotPasswordResetBloc.state.isFormValid &&
        isPopulated &&
        !_forgotPasswordResetBloc.state.isSubmitting;
  }

  _buildResend() => WidgetResendOTP(email: widget.email);

  _buildButtonForgotPassword(ForgotPasswordResetState state) {
    return WidgetLoginButton(
      onTap: () {
        if(isPopulated){
          if (_newPasswordController.text.trim().length < 6
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
          else
            if(_newPasswordController.text.trim() != _confirmNewPasswordController.text.trim()){
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      title: Text("Lỗi", style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: Colors.red, fontSize: 16),),
                      content: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Mật khẩu nhập lại không trùng khớp!\nVui lòng kiểm tra lại.", style: AppStyle.DEFAULT_SMALL_BOLD.copyWith(color: Colors.black), ),
                        ),
                      ),
                      actions: [
                        RaisedButton(
                            child: Text("OK"),
                            color: Colors.blue,
                            onPressed: (){
                              Navigator.of(context, rootNavigator: true).pop('dialog');
                            }
                        ),
                      ],
                    );
                  });
            }
            else
              if(_OTPController.text.trim().length != 4){
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      title: Text("Lỗi", style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: Colors.red, fontSize: 16),),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text("Mã OTP gồm 4 chữ số.\nVui lòng kiểm tra lại", style: AppStyle.DEFAULT_SMALL_BOLD.copyWith(color: Colors.black), )),
                      ),
                      actions: [
                        RaisedButton(
                            child: Text("OK"),
                            color: Colors.blue,
                            onPressed: (){
                              Navigator.of(context, rootNavigator: true).pop('dialog');
                            }
                        ),
                      ],
                    );
                  });
            }
              else  {
                _forgotPasswordResetBloc.add(
                    ForgotPasswordResetSubmitted(
                        email: widget.email,
                        password: _newPasswordController.text.trim(),
                        otpCode: _OTPController.text.trim()
                    )
                );
                FocusScope.of(context).unfocus();
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
      text: AppLocalizations.of(context).translate('forgot_password_reset.update'),
    );
  }


  _buildTextFieldEmail() {
    return WidgetInput(
      inputType: TextInputType.emailAddress,
      inputController: _emailController,
      validator: AppValidation.validateEmail(
          AppLocalizations.of(context).translate('forgot_password.username_invalid')),
      autovalidate: false,
      hint: AppLocalizations.of(context).translate('forgot_password.username_hint'),
      labelText: AppLocalizations.of(context).translate('forgot_password.username_hint'),
      endIcon: GestureDetector(
        onTap: (){
          this._emailController.clear();
        },
        child: Icon(Icons.highlight_remove,
            color: Colors.grey,
            size: 20),
      ),
      leadIcon: Image.asset("assets/icons/email.png", fit: BoxFit.fill,color: Colors.grey,),
    );
  }

  _buildTextFieldNewPassword() {
    return WidgetInput(
      inputType: TextInputType.text,
      inputController: _newPasswordController,
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('forgot_password_reset.password_invalid')),
      autovalidate: false,
      obscureText: obscurePassword,
      hint: AppLocalizations.of(context).translate('forgot_password_reset.password_hint'),
      labelText: AppLocalizations.of(context).translate('forgot_password_reset.password_hint'),
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

  _buildTextFieldOTP() {
    return WidgetInput(
      inputType: TextInputType.number,
      inputController: _OTPController,
      validator: AppValidation.validateOTP(
          AppLocalizations.of(context).translate('forgot_password_reset.otp_invalid')),
      autovalidate: false,
      //maxLength: 4,
      hint: AppLocalizations.of(context).translate('forgot_password_reset.otp'),
      labelText: AppLocalizations.of(context).translate('forgot_password_reset.otp'),
      endIcon: GestureDetector(
        onTap: (){
          this._OTPController.clear();
        },
        child: Icon(Icons.highlight_remove,
            color: Colors.grey,
            size: 20),
      ),
      leadIcon: Image.asset("assets/icons/secure.png", fit: BoxFit.fill,color: Colors.grey,),
    );
  }

  void _onEmailChange() {
    _forgotPasswordResetBloc.add(EmailChanged(
      email: _emailController.text,
    ));
  }
  void _onNewPasswordChange() {
    _forgotPasswordResetBloc.add(PasswordChanged(
      password: _newPasswordController.text,
    ));
  }
  void _onOTPChange() {
    _forgotPasswordResetBloc.add(OtpCodeChanged(
      otpCode: _OTPController.text,
    ));
  }
}
