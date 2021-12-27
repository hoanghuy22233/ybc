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

import 'bloc/career_form_bloc.dart';
import 'bloc/career_form_event.dart';
import 'bloc/career_form_state.dart';

class WidgetCareerForm extends StatefulWidget {
  final String career;
  final Function onCloseTap;

  const WidgetCareerForm(
      {Key key, @required this.onCloseTap, @required this.career})
      : super(key: key);

  @override
  _WidgetCareerFormState createState() => _WidgetCareerFormState();
}

class _WidgetCareerFormState extends State<WidgetCareerForm> {
  CareerFormBloc _careerFormBloc;
  final TextEditingController _careerController = TextEditingController();

  final underline = new UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.GREY,
    ),
  );

  @override
  void initState() {
    super.initState();
    _careerFormBloc = BlocProvider.of<CareerFormBloc>(context);
    _careerController.text = widget.career ?? '';
    _careerController.addListener(_onCareer);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CareerFormBloc, CareerFormState>(
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
      child: BlocBuilder<CareerFormBloc, CareerFormState>(
          builder: (context, state) {
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
                      "Nghề nghiệp",
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
              _buildTextFieldAdress(),
              _buildButtonSubmit()
            ],
          ),
        );
      }),
    );
  }

  bool get isPopulated => _careerController.text.isNotEmpty;

  bool isSubmitButtonEnabled() {
    return _careerFormBloc.state.isFormValid &&
        isPopulated &&
        !_careerFormBloc.state.isSubmitting;
  }

  _buildButtonSubmit() {
    return WidgetButton(
      height: 45,
      onTap: () {
        if (isSubmitButtonEnabled()) {
          _careerFormBloc.add(CareerFormSubmitEvent(
            career: _careerController.text.trim(),
          ));
        }
      },
      text: AppLocalizations.of(context).translate('profile_detail.update'),
    );
  }

  _buildTextFieldAdress() {
    return TextFormField(
        controller: _careerController,
        validator: (_) {
          print('validator');
          return !_careerFormBloc.state.isCareerValid ? '' : null;
        },
        style: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.PRIMARY),
        maxLines: 1,
        decoration: InputDecoration(
            disabledBorder: underline,
            enabledBorder: underline,
            focusedBorder: underline,
            hintText: "Nhập nghề nghiệp",
            hintStyle: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.GREY)));
  }

  void _onCareer() {
    _careerFormBloc.add(CareerChanged(
      career: _careerController.text,
    ));
  }
}
