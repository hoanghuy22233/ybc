import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/presentation/common_widgets/widget_button.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/bloc.dart';
import 'package:ybc/utils/utils.dart';

import 'bloc/intro_form_bloc.dart';
import 'bloc/intro_form_event.dart';
import 'bloc/intro_form_state.dart';

class WidgetIntroForm extends StatefulWidget {
  final String intro;
  final Function onCloseTap;

  const WidgetIntroForm(
      {Key key, @required this.onCloseTap, @required this.intro})
      : super(key: key);

  @override
  _WidgetIntroFormState createState() => _WidgetIntroFormState();
}

class _WidgetIntroFormState extends State<WidgetIntroForm> {
  IntroFormBloc _introFormBloc;
  final TextEditingController _introController = TextEditingController();

  final underline = new UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.GREY,
    ),
  );

  @override
  void initState() {
    super.initState();
    _introFormBloc = BlocProvider.of<IntroFormBloc>(context);
    _introController.text = widget.intro ?? '';
    _introController.addListener(_onIntroChange);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<IntroFormBloc, IntroFormState>(
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
          BlocBuilder<IntroFormBloc, IntroFormState>(builder: (context, state) {
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
                      "Giới thiệu",
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

  bool get isPopulated => _introController.text.isNotEmpty;

  bool isSubmitButtonEnabled() {
    return _introFormBloc.state.isFormValid &&
        isPopulated &&
        !_introFormBloc.state.isSubmitting;
  }

  _buildButtonSubmit() {
    return WidgetButton(
      height: 45,
      onTap: () {
        if (isSubmitButtonEnabled()) {
          _introFormBloc.add(IntroFormSubmitEvent(
            intro: _introController.text.trim(),
          ));
        }
      },
      text: AppLocalizations.of(context).translate('profile_detail.update'),
    );
  }

  _buildTextFieldEmail() {
    return TextFormField(
        controller: _introController,
        validator: (_) {
          print('validator');
          return !_introFormBloc.state.isIntroValid ? '' : null;
        },
        style: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.PRIMARY),
        maxLines: 4,
        decoration: InputDecoration(
            disabledBorder: underline,
            enabledBorder: underline,
            focusedBorder: underline,
            hintText: "Lời giới thiệu",
            hintStyle: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.GREY)));
  }

  void _onIntroChange() {
    _introFormBloc.add(IntroChanged(
      intro: _introController.text,
    ));
  }
}
