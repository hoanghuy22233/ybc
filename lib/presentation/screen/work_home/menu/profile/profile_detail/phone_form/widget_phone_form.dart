import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/widget_button.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_event.dart';
import 'package:ybc/utils/utils.dart';

import 'bloc/phone_form_bloc.dart';
import 'bloc/phone_form_event.dart';
import 'bloc/phone_form_state.dart';

class WidgetPhoneForm extends StatefulWidget {
  final String phone;
  final Function onCloseTap;

  const WidgetPhoneForm(
      {Key key, @required this.onCloseTap, @required this.phone})
      : super(key: key);

  @override
  _WidgetPhoneFormState createState() => _WidgetPhoneFormState();
}

class _WidgetPhoneFormState extends State<WidgetPhoneForm> {
  PhoneFormBloc _phoneFormBloc;
  final TextEditingController _phoneController = TextEditingController();

  final underline = new UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.GREY,
    ),
  );

  @override
  void initState() {
    super.initState();
    _phoneFormBloc = BlocProvider.of<PhoneFormBloc>(context);
    _phoneController.text = widget.phone ?? '';
    _phoneController.addListener(_onPhoneChange);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneFormBloc, PhoneFormState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }

        if (state.isSuccess) {
          await HttpHandler.resolve(status: state.status);
          AppNavigator.navigateBack();
          BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
          BlocProvider.of<ProfileBloc>(context).add(RefreshProfile());
        }

        if (state.isFailure) {
          await HttpHandler.resolve(status: state.status);
        }
      },
      child:
          BlocBuilder<PhoneFormBloc, PhoneFormState>(builder: (context, state) {
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
                          .translate('profile_detail.phone'),
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
              _buildTextFieldPhone(),
              _buildButtonSubmit()
            ],
          ),
        );
      }),
    );
  }

  bool get isPopulated => _phoneController.text.isNotEmpty;

  bool isSubmitButtonEnabled() {
    return _phoneFormBloc.state.isFormValid &&
        isPopulated &&
        !_phoneFormBloc.state.isSubmitting;
  }

  _buildButtonSubmit() {
    return WidgetButton(
      height: 45,
      onTap: () {
        if (isSubmitButtonEnabled()) {
          _phoneFormBloc.add(PhoneFormSubmitEvent(
            phone: _phoneController.text.trim(),
          ));
        }
      },
      text: AppLocalizations.of(context).translate('profile_detail.update'),
    );
  }

  _buildTextFieldPhone() {
    return TextFormField(
        controller: _phoneController,
        validator: (_) {
          print('validator');
          return !_phoneFormBloc.state.isPhoneValid ? '' : null;
        },
        style: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.PRIMARY),
        maxLines: 1,
        decoration: InputDecoration(
            disabledBorder: underline,
            enabledBorder: underline,
            focusedBorder: underline,
            hintText: AppLocalizations.of(context)
                .translate('profile_detail.phone_hint'),
            hintStyle: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.GREY)));
  }

  void _onPhoneChange() {
    _phoneFormBloc.add(PhoneChanged(
      phone: _phoneController.text,
    ));
  }
}
