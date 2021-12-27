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

class WidgetSamplePlanFormTwo extends StatefulWidget {
  @override
  _WidgetSamplePlanFormTwoState createState() => _WidgetSamplePlanFormTwoState();
}

class _WidgetSamplePlanFormTwoState extends State<WidgetSamplePlanFormTwo> {
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
    double iconSize = 40;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(0),
              child: Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                      children: [
                        TableCell(child: Text('')),
                        TableCell(
                          child: SizedBox(height: 100,
                            child: Center(child: Text('Giá bán trung bình', textAlign: TextAlign.center,)),),
                        ),
                        TableCell(
                          child: SizedBox(height: 100,
                            child: Center(child: Text('SL', textAlign: TextAlign.center,)),),
                        ),
                        TableCell(
                          child: SizedBox(height: 100,
                            child: Center(child: Text('Doanh thu hàng ngày', textAlign: TextAlign.center,)),),
                        ),
                        TableCell(
                          child: SizedBox(height: 100,
                            child: Center(child: Text('Doanh thu hàng tháng', textAlign: TextAlign.center,)),),
                        ),
                  ]),
                  TableRow( children: [
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('Bán lẻ/ngày', textAlign: TextAlign.center,)),),
                    ),
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('', textAlign: TextAlign.center,)),),
                    ),
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('', textAlign: TextAlign.center,)),),
                    ),
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('', textAlign: TextAlign.center,)),),
                    ),
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('', textAlign: TextAlign.center,)),),
                    ),
                  ]),
                  TableRow( children: [
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('Sự kiện/tháng', textAlign: TextAlign.center,)),),
                    ),
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('', textAlign: TextAlign.center,)),),
                    ),
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('', textAlign: TextAlign.center,)),),
                    ),
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('', textAlign: TextAlign.center,)),),
                    ),
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('', textAlign: TextAlign.center,)),),
                    ),
                  ]),
                  TableRow( children: [
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('Doanh thu khác', textAlign: TextAlign.center,)),),
                    ),
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('', textAlign: TextAlign.center,)),),
                    ),
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('', textAlign: TextAlign.center,)),),
                    ),
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('', textAlign: TextAlign.center,)),),
                    ),
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('', textAlign: TextAlign.center,)),),
                    ),
                  ]),
                  TableRow( children: [
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('Tổng doanh thu', textAlign: TextAlign.center,)),),
                    ),
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('', textAlign: TextAlign.center,)),),
                    ),
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('', textAlign: TextAlign.center,)),),
                    ),
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('', textAlign: TextAlign.center,)),),
                    ),
                    TableCell(
                      child: SizedBox(height: 100,
                        child: Center(child: Text('', textAlign: TextAlign.center,)),),
                    ),

                  ]),
                ],
              ),
            ),
            WidgetSpacer(
              height: 25,
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
        AppNavigator.navigateChooseTemplate();
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
