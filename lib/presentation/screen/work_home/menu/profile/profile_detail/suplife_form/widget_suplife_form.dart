import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/widget_button.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/suplife_form/bloc/bloc.dart';
import 'package:ybc/utils/utils.dart';

class WidgetSuplifeForm extends StatefulWidget {
  final String suplife;
  final Function onCloseTap;

  const WidgetSuplifeForm(
      {Key key, @required this.onCloseTap, @required this.suplife})
      : super(key: key);

  @override
  _WidgetSuplifeFormState createState() => _WidgetSuplifeFormState();
}

class _WidgetSuplifeFormState extends State<WidgetSuplifeForm> {
  SuplifeFormBloc _suplifeFormBloc;
  final TextEditingController _suplifeController = TextEditingController();

  final underline = new UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.GREY,
    ),
  );

  @override
  void initState() {
    super.initState();
    _suplifeFormBloc = BlocProvider.of<SuplifeFormBloc>(context);
    _suplifeController.text = widget.suplife ?? '';
    _suplifeController.addListener(_onSuplifeChange);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SuplifeFormBloc, SuplifeFormState>(
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
      child: BlocBuilder<SuplifeFormBloc, SuplifeFormState>(
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
                      "Ngành nghề",
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

  bool get isPopulated => _suplifeController.text.isNotEmpty;

  bool isSubmitButtonEnabled() {
    return _suplifeFormBloc.state.isFormValid &&
        isPopulated &&
        !_suplifeFormBloc.state.isSubmitting;
  }

  _buildButtonSubmit() {
    return WidgetButton(
      height: 45,
      onTap: () {
        if (isSubmitButtonEnabled()) {
          _suplifeFormBloc.add(SuplifeFormSubmitEvent(
            suplife: _suplifeController.text.trim(),
          ));
        }
      },
      text: AppLocalizations.of(context).translate('profile_detail.update'),
    );
  }

  _buildTextFieldEmail() {
    return TextFormField(
        controller: _suplifeController,
        validator: (_) {
          print('validator');
          return !_suplifeFormBloc.state.isSuplifeValid ? '' : null;
        },
        style: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.PRIMARY),
        maxLines: 1,
        decoration: InputDecoration(
            disabledBorder: underline,
            enabledBorder: underline,
            focusedBorder: underline,
            hintText: "Nhập ngành nghề",
            hintStyle: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.GREY)));
  }

  void _onSuplifeChange() {
    _suplifeFormBloc.add(SuplifeChanged(
      suplife: _suplifeController.text,
    ));
  }
}
