import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/app/constants/string/validator.dart';
import 'package:ybc/presentation/common_widgets/widget_input.dart';
import 'package:ybc/presentation/common_widgets/widget_login_button.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/utils/locale/app_localization.dart';
import 'package:ybc/utils/snackbar/get_snack_bar_utils.dart';
import 'package:ybc/presentation/common_widgets/widget_dialog.dart';

class WidgetContactForm extends StatefulWidget {
  @override
  _WidgetContactFormState createState() => _WidgetContactFormState();
}

class _WidgetContactFormState extends State<WidgetContactForm> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool autoValidate = false;


  bool get isPopulated =>
      _nameController.text.isNotEmpty &&
      _telController.text.isNotEmpty &&
      _emailController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    // _registerBloc = BlocProvider.of<RegisterBloc>(context);

    // _nameController.addListener(_onNameChange);
    // _passwordController.addListener(_onPasswordChanged);
    // _rePasswordController.addListener(_onRePasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetSpacer(
              height: 10,
            ),
            _buildTextFieldName(),
            WidgetSpacer(
              height: 10,
            ),
            _buildTextFieldTel(),
            WidgetSpacer(
              height: 10,
            ),
            _buildTextFieldEmail(),

            WidgetSpacer(
              height: 20,
            ),
            _buildButtonRegisterContact()
          ],
        ),
      ),
    );
  }


  bool isRegisterButtonEnabled() {
    // return _registerBloc.state.isFormValid &&
    //     isPopulated &&
    //     !_registerBloc.state.isSubmitting;
    return isPopulated;
  }


  _buildButtonRegisterContact() {
    return WidgetLoginButton(
      onTap: () {
        if(isPopulated){
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return WidgetDialog(
                  title: 'Thành công',
                  content: "Thông tin đã được gửi về ban quản trị!",
                  image: 'assets/icons/check.png',
                  action1: (){
                    AppNavigator.navigateWorkService();
                  },
                  colorButton1: Colors.blue,
                  titleAction1: 'Về trang chủ',
                );
              });
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return WidgetDialog(
                  title: 'Lỗi',
                  content: "Chưa nhập đầy đủ thông tin!",
                  //image: 'assets/icons/check.png',
                  action1: (){
                    AppNavigator.navigateBack();
                  },
                  colorButton1: Colors.blue,
                  titleAction1: 'OK',
                );
              });
        }

      },
      isEnable: !true,
      height: 45,
      backgroundColor: Colors.blue,
      text: AppLocalizations.of(context).translate('register_contact.title_button'),
    );
  }

  _buildTextFieldName() {
    return WidgetInput(
      inputType: TextInputType.name,
      autovalidate: autoValidate,
      onChanged: (value) {
        //_registerBloc.add(NameChanged(name: value));
      },
      hint: AppLocalizations.of(context).translate('register.name'),
      labelText: AppLocalizations.of(context).translate('register.name'),
      inputController: _nameController,
      validator: AppValidation.validateFullName(
          AppLocalizations.of(context).translate('register.name_invalid')),
      endIcon: GestureDetector(
            onTap: (){
              this._nameController.clear();
            },
            child: Icon(Icons.highlight_remove,
                color: Colors.grey,
                size: 20),
          ),
      leadIcon: Image.asset("assets/icons/avatar.png", fit: BoxFit.fill,color: Colors.black,),
    );
  }

  _buildTextFieldTel() {
    return WidgetInput(
      inputType: TextInputType.phone,
      inputController: _telController,
      onChanged: (value) {
        //_registerBloc.add(TelChanged(tel: value));
      },
      validator: AppValidation.validatePhoneNumber(
          AppLocalizations.of(context).translate('register.tel_invalid')),
      autovalidate: autoValidate,
      hint: AppLocalizations.of(context).translate('register.tel'),
      labelText: AppLocalizations.of(context).translate('register.tel'),
      endIcon: GestureDetector(
        onTap: (){
          this._telController.clear();
        },
        child: Icon(Icons.highlight_remove,
            color: Colors.grey,
            size: 20),
      ),
      leadIcon: Image.asset("assets/icons/phone-call.png", fit: BoxFit.fill,color: Colors.black,),
    );
  }

  _buildTextFieldEmail() {
    return WidgetInput(
      inputType: TextInputType.emailAddress,
      inputController: _emailController,
      onChanged: (value) {
       //_registerBloc.add(EmailChanged(email: value));
      },
      validator: AppValidation.validateEmail(
          AppLocalizations.of(context).translate('register.email_invalid')),
      autovalidate: autoValidate,
      hint: AppLocalizations.of(context).translate('register.email'),
      labelText: AppLocalizations.of(context).translate('register.email'),
      endIcon: GestureDetector(
        onTap: (){
          this._emailController.clear();
        },
        child: Icon(Icons.highlight_remove,
            color: Colors.grey,
            size: 20),
      ),
      leadIcon: Image.asset("assets/icons/email.png", fit: BoxFit.fill,color: Colors.black,),
    );
  }


  // void _onNameChange() {
  //   _registerBloc.add(NameChanged(
  //     name: _nameController.text,
  //   ));
  // }
  //
  // void _onPasswordChanged() {
  //   _registerBloc.add(PasswordChanged(
  //     password: _passwordController.text));
  // }
  //
  // void _onRePasswordChanged() {
  //   _registerBloc.add(RePasswordChanged(
  //     password: _passwordController.text,
  //     rePassword: _rePasswordController.text
  //   ));
  // }



  @override
  void dispose() {
    _nameController.dispose();
    _telController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

