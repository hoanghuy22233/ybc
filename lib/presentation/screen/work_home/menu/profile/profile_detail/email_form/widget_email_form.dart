import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/presentation/common_widgets/widget_button.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_event.dart';
import 'package:ybc/utils/utils.dart';

import 'bloc/email_form_bloc.dart';
import 'bloc/email_form_event.dart';
import 'bloc/email_form_state.dart';

class WidgetEmailForm extends StatefulWidget {
  final String email;
  final Function onCloseTap;

  const WidgetEmailForm(
      {Key key, @required this.onCloseTap, @required this.email})
      : super(key: key);

  @override
  _WidgetEmailFormState createState() => _WidgetEmailFormState();
}

class _WidgetEmailFormState extends State<WidgetEmailForm> {
  EmailFormBloc _emailFormBloc;
  final TextEditingController _emailController = TextEditingController();

  final underline = new UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.GREY,
    ),
  );

  @override
  void initState() {
    super.initState();
    _emailFormBloc = BlocProvider.of<EmailFormBloc>(context);
    _emailController.text = widget.email ?? '';
    _emailController.addListener(_onEmailChange);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailFormBloc, EmailFormState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }

        if (state.isSuccess) {
          await HttpHandler.resolve(status: state.status);
          BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
          AppNavigator.navigateBack();

          BlocProvider.of<ProfileBloc>(context).add(RefreshProfile());
        }

        if (state.isFailure) {
          await HttpHandler.resolve(status: state.status);
        }
      },
      child:
          BlocBuilder<EmailFormBloc, EmailFormState>(builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(AppValue.APP_HORIZONTAL_PADDING),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppValue.APP_HORIZONTAL_PADDING),
                  topRight: Radius.circular(AppValue.APP_HORIZONTAL_PADDING))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)
                          .translate('profile_detail.email'),
                      style: AppStyle.DEFAULT_MEDIUM_BOLD,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onCloseTap,
                    child: Container(
                      width: 20,
                      height: 20,
                      child: Image.asset('assets/images/img_close_round.png'),
                    ),
                  )
                ],
              ),
              _buildTextFieldEmail(),
              _buildButtonSubmit()
            ],
          ),
        );
      }),
    );
  }

  bool get isPopulated => _emailController.text.isNotEmpty;

  bool isSubmitButtonEnabled() {
    return _emailFormBloc.state.isFormValid &&
        isPopulated &&
        !_emailFormBloc.state.isSubmitting;
  }

  _buildButtonSubmit() {
    return WidgetButton(
      height: 45,
      onTap: () {
        if (isSubmitButtonEnabled()) {
          _emailFormBloc.add(EmailFormSubmitEvent(
            email: _emailController.text.trim(),
          ));
        }
      },
      text: AppLocalizations.of(context).translate('profile_detail.update'),
    );
  }

  _buildTextFieldEmail() {
    return TextFormField(
        controller: _emailController,
        validator: (_) {
          print('validator');
          return !_emailFormBloc.state.isEmailValid ? '' : null;
        },
        style: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.PRIMARY),
        maxLines: 1,
        decoration: InputDecoration(
            disabledBorder: underline,
            enabledBorder: underline,
            focusedBorder: underline,
            hintText: AppLocalizations.of(context)
                .translate('profile_detail.email_hint'),
            hintStyle: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.GREY)));
  }

  void _onEmailChange() {
    _emailFormBloc.add(EmailChanged(
      email: _emailController.text,
    ));
  }
}
