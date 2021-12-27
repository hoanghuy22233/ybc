import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/string/validator.dart';
import 'package:ybc/presentation/common_widgets/widget_input.dart';
import 'package:ybc/presentation/common_widgets/widget_login_button.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/utils/locale/app_localization.dart';
import 'package:ybc/utils/snackbar/get_snack_bar_utils.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';

import 'bloc/bloc.dart';

class WidgetForgotPasswordForm extends StatefulWidget {
  @override
  _WidgetForgotPasswordFormState createState() =>
      _WidgetForgotPasswordFormState();
}

class _WidgetForgotPasswordFormState extends State<WidgetForgotPasswordForm> {
  ForgotPasswordBloc _forgotPasswordBloc;

  final TextEditingController _emailController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool get isPopulated => _emailController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _forgotPasswordBloc = BlocProvider.of<ForgotPasswordBloc>(context);
    _emailController.addListener(_onUsernameChange);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }
        if (state.isSuccess) {
          await GetSnackBarUtils.createSuccess(message: state.message);
          AppNavigator.navigateForgotPassReset(
              email: _emailController.text.trim());
          //AppNavigator.navigateLogin();
          //showAlertDialog(context);
        }

        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
        }
      },
      child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(top: 20),
            child: Form(
              child: Column(
                children: [
                  _buildTextFieldEmail(),
                  WidgetSpacer(
                    height: 20,
                  ),
                  _buildButtonForgotPassword(state)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool isForgotPasswordButtonEnabled() {
    return _forgotPasswordBloc.state.isFormValid &&
        isPopulated &&
        !_forgotPasswordBloc.state.isSubmitting;
  }

  _buildButtonForgotPassword(ForgotPasswordState state) {
    return WidgetLoginButton(
      onTap: () {
        if (isForgotPasswordButtonEnabled()) {
          _forgotPasswordBloc.add(ForgotPasswordSubmitted(
              email: _emailController.text.trim()));
          FocusScope.of(context).unfocus();
        }
      },
      isEnable: !isForgotPasswordButtonEnabled(),
      height: 45,
      backgroundColor: Colors.blue,
      text: AppLocalizations.of(context).translate('forgot_password.continue'),
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

  void _onUsernameChange() {
    _forgotPasswordBloc.add(UsernameChanged(
      email: _emailController.text,
    ));
  }

}
