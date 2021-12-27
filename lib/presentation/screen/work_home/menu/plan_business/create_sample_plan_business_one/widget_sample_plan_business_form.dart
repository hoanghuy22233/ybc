import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/app/constants/string/validator.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/presentation/common_widgets/widget_link.dart';
import 'package:ybc/presentation/common_widgets/widget_login_button.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/menu/plan_business/create_sample_plan_business_one/widget_input.dart';
import 'package:ybc/utils/locale/app_localization.dart';

class WidgetSamplePlanForm extends StatefulWidget {
  @override
  _WidgetSamplePlanFormState createState() => _WidgetSamplePlanFormState();
}

class _WidgetSamplePlanFormState extends State<WidgetSamplePlanForm> {
  // LoginBloc _loginBloc;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscurePassword = true;
  bool autoValidate = false;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    // _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      width: 0.5
                  ),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/your_logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Tên cửa hàng', style: AppStyle.DEFAULT_SMALL_BOLD,),
            ),
            _buildTextFieldNameStore(),
            WidgetSpacer(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Thời gian hoạt động dự kiến', style: AppStyle.DEFAULT_SMALL_BOLD,),
            ),
            _buildTextFieldTimeExpected(),
            WidgetSpacer(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Ngành nghề hoạt động', style: AppStyle.DEFAULT_SMALL_BOLD,),
            ),
            _buildTextFieldCareer(),
            WidgetSpacer(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Quy mô công ty', style: AppStyle.DEFAULT_SMALL_BOLD,),
            ),
            _buildTextFieldSize(),
            WidgetSpacer(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Vốn chủ sở hữu', style: AppStyle.DEFAULT_SMALL_BOLD,),
            ),
            _buildTextFieldCapital(),
            WidgetSpacer(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Địa chỉ cửa hàng', style: AppStyle.DEFAULT_SMALL_BOLD,),
            ),
            _buildTextFieldAddressStore(),
            WidgetSpacer(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Đặc điểm cửa hàng', style: AppStyle.DEFAULT_SMALL_BOLD,),
            ),
            _buildTextFieldDetailStore(),
            WidgetSpacer(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Các định hướng hoạt động', style: AppStyle.DEFAULT_SMALL_BOLD,),
            ),
            _buildTextFieldDirectionOfOperation(),
            WidgetSpacer(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Mục tiêu', style: AppStyle.DEFAULT_SMALL_BOLD,),
            ),
            _buildTextFieldtarget(),
            WidgetSpacer(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Tầm nhìn', style: AppStyle.DEFAULT_SMALL_BOLD,),
            ),
            _buildTextFieldVision(),
            WidgetSpacer(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Sứ mệnh', style: AppStyle.DEFAULT_SMALL_BOLD,),
            ),
            _buildTextFieldMission(),
            WidgetSpacer(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Giá trị cốt lõi', style: AppStyle.DEFAULT_SMALL_BOLD,),
            ),
            _buildTextFieldCoreValue(),
            WidgetSpacer(
              height: 20,
            ),
            Center(
              child: _buildButtonLogin(),
            ),

            WidgetSpacer(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }


  _buildButtonLogin() {
    return WidgetLoginButton(
      onTap: () {
        AppNavigator.navigateCreateSamplePlanTwo();
      },
      isEnable: true,
      backgroundColor: Colors.blue,
      text: AppLocalizations.of(context).translate('continue'),
      height: 40,
    );
  }

  _buildTextFieldNameStore() {
    return WidgetInput(
      autovalidate: autoValidate,
      inputController: _passwordController,
      onChanged: (value) {

      },
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('login.password_invalid')),
      hint: AppLocalizations.of(context).translate('content'),
    );
  }

  _buildTextFieldTimeExpected() {
    return WidgetInput(
      autovalidate: autoValidate,
      inputController: _passwordController,
      onChanged: (value) {

      },
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('login.password_invalid')),
      hint: AppLocalizations.of(context).translate('content'),
    );
  }

  _buildTextFieldCareer() {
    return WidgetInput(
      autovalidate: autoValidate,
      inputController: _passwordController,
      onChanged: (value) {

      },
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('login.password_invalid')),
      hint: AppLocalizations.of(context).translate('all_job'),
      bigSize: true,
    );
  }

  _buildTextFieldSize() {
    return WidgetInput(
      autovalidate: autoValidate,
      inputController: _passwordController,
      onChanged: (value) {

      },
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('login.password_invalid')),
      hint: AppLocalizations.of(context).translate('content'),
    );
  }

  _buildTextFieldCapital() {
    return WidgetInput(
      autovalidate: autoValidate,
      inputController: _passwordController,
      onChanged: (value) {

      },
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('login.password_invalid')),
      hint: AppLocalizations.of(context).translate('content'),
    );
  }

  _buildTextFieldAddressStore() {
    return WidgetInput(
      autovalidate: autoValidate,
      inputController: _passwordController,
      onChanged: (value) {

      },
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('login.password_invalid')),
      hint: AppLocalizations.of(context).translate('content'),
    );
  }

  _buildTextFieldDetailStore() {
    return WidgetInput(
      autovalidate: autoValidate,
      inputController: _passwordController,
      onChanged: (value) {

      },
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('login.password_invalid')),
      hint: AppLocalizations.of(context).translate('detail_store'),
      bigSize: true,
    );
  }

  _buildTextFieldDirectionOfOperation() {
    return WidgetInput(
      autovalidate: autoValidate,
      inputController: _passwordController,
      onChanged: (value) {

      },
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('login.password_invalid')),
      hint: AppLocalizations.of(context).translate('content'),
      bigSize: true,
    );
  }

  _buildTextFieldtarget() {
    return WidgetInput(
      autovalidate: autoValidate,
      inputController: _passwordController,
      onChanged: (value) {

      },
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('login.password_invalid')),
      hint: AppLocalizations.of(context).translate('content'),
      bigSize: true,
    );
  }

  _buildTextFieldVision() {
    return WidgetInput(
      autovalidate: autoValidate,
      inputController: _passwordController,
      onChanged: (value) {

      },
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('login.password_invalid')),
      hint: AppLocalizations.of(context).translate('content'),
      bigSize: true,
    );
  }

  _buildTextFieldMission() {
    return WidgetInput(
      autovalidate: autoValidate,
      inputController: _passwordController,
      onChanged: (value) {

      },
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('login.password_invalid')),
      hint: AppLocalizations.of(context).translate('content'),
      bigSize: true,
    );
  }

  _buildTextFieldCoreValue() {
    return WidgetInput(
      autovalidate: autoValidate,
      inputController: _passwordController,
      onChanged: (value) {

      },
      validator: AppValidation.validatePassword(
          AppLocalizations.of(context).translate('login.password_invalid')),
      hint: AppLocalizations.of(context).translate('content'),
      bigSize: true,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
