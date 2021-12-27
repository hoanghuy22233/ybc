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
import 'package:ybc/app/constants/barrel_constants.dart';

import 'bloc/bloc.dart';

class WidgetRegisterForm extends StatefulWidget {
  @override
  _WidgetRegisterFormState createState() => _WidgetRegisterFormState();
}

class _WidgetRegisterFormState extends State<WidgetRegisterForm> {
  RegisterBloc _registerBloc;

  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool autoValidate = false;
  bool checkedValue1 = false;
  bool checkedValue2 = false;
  bool checkedValue3 = false;

  int type = 0;

  bool get isPopulated =>
      _nameController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty &&
      _rePasswordController.text.isNotEmpty &&
      _telController.text.isNotEmpty &&
      _emailController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);

    _nameController.addListener(_onNameChange);
    _passwordController.addListener(_onPasswordChanged);
    _rePasswordController.addListener(_onRePasswordChanged);
    _telController.addListener(_onTelChanged);
    _emailController.addListener(_onEmailChanged);
    checkedValue1 = true;

    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    type = 0;
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
      print('Dropbox ID: ${_selectedCompany.id}');
      type = _selectedCompany.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }

        if (state.isSuccess) {
          await GetSnackBarUtils.createSuccess(message: state.message);
          AppNavigator.navigateLogin();
        }

        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
          setState(() {
            autoValidate = true;
          });
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Container(
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
                      height: 10,
                    ),
                    _buildTextFieldPassword(),
                    WidgetSpacer(
                      height: 10,
                    ),
                    _buildTextFieldRePassword(),
                    WidgetSpacer(
                      height: 10,
                    ),
                    _buildChooseType(),
                    WidgetSpacer(
                      height: 20,
                    ),
                    _buildButtonRegister(state)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  bool isRegisterButtonEnabled() {
    return _registerBloc.state.isFormValid &&
        isPopulated &&
        !_registerBloc.state.isSubmitting;
  }

String errorText='';
  _buildButtonRegister(RegisterState state) {
    return WidgetLoginButton(
      onTap: () {
        if(isPopulated){
          if (!_registerBloc.state.isNameValid) {
            errorText = errorText + "Sai định dạng tên\n\n";
          }
          if (type == 0) {
            errorText = errorText + "Chưa chọn loại tài khoản\n\n";
          }
          if (!_registerBloc.state.isTelValid) {
            errorText = errorText + "Sai định dạng số điện thoại\n\n";
          }
          if (!_registerBloc.state.isEmailValid) {
            errorText = errorText + "Sai định dạng email\n\n";
          }
          if (_passwordController.text.trim() != _rePasswordController.text.trim()) {
            errorText = errorText + "Mật khẩu nhập lại không khớp\n";
          }


          if(errorText == '') {
            _registerBloc.add(RegisterSubmitted(
                name: _nameController.text.trim(),
                password: _passwordController.text.trim(),
                tel: _telController.text.trim(),
                email: _emailController.text.trim(),
                type: _selectedCompany.id));
            FocusScope.of(context).unfocus();
          }
          else{
            print('lỗi : $errorText');
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
                          Center(child: Text('$errorText', style: AppStyle.DEFAULT_SMALL_BOLD.copyWith(color: Colors.black), )),
                        ],
                      ),
                    ),
                    actions: [
                      RaisedButton(
                          child: Text("OK"),
                          color: Colors.red,
                          onPressed: (){
                            Navigator.of(context, rootNavigator: true).pop('dialog');
                            setState(() {
                              errorText='';
                            });
                          }
                      ),
                    ],
                  );
                });
          }

          FocusScope.of(context).unfocus();
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
      isEnable: !isRegisterButtonEnabled(),
      height: 45,
      backgroundColor: Colors.blue,
      text: AppLocalizations.of(context).translate('register.register'),
    );
  }

  _buildTextFieldName() {
    return WidgetInput(
      inputType: TextInputType.name,
      autovalidate: autoValidate,
      onChanged: (value) {
        _registerBloc.add(NameChanged(name: value));
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
        _registerBloc.add(TelChanged(tel: value));
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
        _registerBloc.add(EmailChanged(email: value));
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
      leadIcon:Image.asset("assets/icons/email.png", fit: BoxFit.fill,color: Colors.black,),
    );
  }

  _buildTextFieldPassword() {
    return WidgetInput(
      inputController: _passwordController,
      onChanged: (value) {
        _registerBloc.add(PasswordChanged(password: value));
      },
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('register.password_invalid')),
      autovalidate: autoValidate,
      hint: AppLocalizations.of(context).translate('register.password'),
      labelText: AppLocalizations.of(context).translate('register.password'),
      obscureText: obscurePassword,
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
      leadIcon: Image.asset("assets/icons/lock.png", fit: BoxFit.fill,color: Colors.black,),
    );
  }

  _buildTextFieldRePassword() {
    return WidgetInput(
      inputController: _rePasswordController,
      onChanged: (value) {
        _registerBloc.add(PasswordChanged(password: value));
      },
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('register.rePassword_invalid')),
      autovalidate: autoValidate,
      hint: AppLocalizations.of(context).translate('register.rePassword'),
      labelText: AppLocalizations.of(context).translate('register.rePassword'),
      obscureText: obscureConfirmPassword,
      endIcon: GestureDetector(
        onTap: (){
          setState(() {
            obscureConfirmPassword = !obscureConfirmPassword;
          });
        },
        child: Icon(
          obscureConfirmPassword
              ? MaterialCommunityIcons.eye_outline
              : MaterialCommunityIcons.eye_off_outline,
          color: AppColor.GREY,
          size: 20,
        ),
      ),
      leadIcon: Image.asset("assets/icons/lock.png", fit: BoxFit.fill,color: Colors.black,),
    );
  }

  _buildChooseType() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: DropdownButton(
        value: _selectedCompany,
        items: _dropdownMenuItems,
        onChanged: onChangeDropdownItem,
        elevation: 5,
        //isExpanded: true,
        style: TextStyle(color: Colors.black, fontSize: 14.0),
      ),
    );
  }

  void _onNameChange() {
    _registerBloc.add(NameChanged(
      name: _nameController.text,
    ));
  }

  void _onPasswordChanged() {
    _registerBloc.add(PasswordChanged(
      password: _passwordController.text));
  }

  void _onRePasswordChanged() {
    _registerBloc.add(RePasswordChanged(
      password: _passwordController.text,
      rePassword: _rePasswordController.text
    ));
  }

  void _onTelChanged() {
    _registerBloc.add(TelChanged(
        tel: _telController.text));
  }

  void _onEmailChanged() {
    _registerBloc.add(EmailChanged(
        email: _emailController.text));
    }

    void _onTypeChanged() {
    _registerBloc.add(TypeChanged(
        type: type));
    }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    _telController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(0, 'Chọn tài khoản'),
      Company(1, 'Thành viên chính thức'),
      Company(2, 'Nhà đầu tư'),
      Company(3, 'Chuyên gia'),
    ];
  }
}
