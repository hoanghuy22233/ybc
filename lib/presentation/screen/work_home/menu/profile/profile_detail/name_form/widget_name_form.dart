import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/widget_button.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_event.dart';
import 'package:ybc/utils/utils.dart';

import 'bloc/name_form_bloc.dart';
import 'bloc/name_form_event.dart';
import 'bloc/name_form_state.dart';

class WidgetNameForm extends StatefulWidget {
  final String name;
  final Function onCloseTap;

  const WidgetNameForm(
      {Key key, @required this.onCloseTap, @required this.name})
      : super(key: key);

  @override
  _WidgetNameFormState createState() => _WidgetNameFormState();
}

class _WidgetNameFormState extends State<WidgetNameForm> {
  NameFormBloc _nameFormBloc;
  final TextEditingController _nameController = TextEditingController();

  final underline = new UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.GREY,
    ),
  );

  @override
  void initState() {
    super.initState();
    _nameFormBloc = BlocProvider.of<NameFormBloc>(context);
    _nameController.text = widget.name ?? '';
    _nameController.addListener(_onNameChange);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NameFormBloc, NameFormState>(
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
          BlocBuilder<NameFormBloc, NameFormState>(builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(AppValue.APP_HORIZONTAL_PADDING),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)
                          .translate('profile_detail.fullname'),
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
              _buildTextFieldName(),
              _buildButtonSubmit()
            ],
          ),
        );
      }),
    );
  }

  bool get isPopulated => _nameController.text.isNotEmpty;

  bool isSubmitButtonEnabled() {
    return _nameFormBloc.state.isFormValid &&
        isPopulated &&
        !_nameFormBloc.state.isSubmitting;
  }

  _buildButtonSubmit() {
    return WidgetButton(
      height: 45,
      onTap: () {
        if (isSubmitButtonEnabled()) {
          _nameFormBloc.add(NameFormSubmitEvent(
            fullname: _nameController.text.trim(),
          ));
        }
      },
      text: AppLocalizations.of(context).translate('profile_detail.update'),
    );
  }

  _buildTextFieldName() {
    return TextFormField(
        controller: _nameController,
        validator: (_) {
          print('validator');
          return !_nameFormBloc.state.isNameValid ? '' : null;
        },
        style: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.PRIMARY),
        maxLines: 1,
        decoration: InputDecoration(
            disabledBorder: underline,
            enabledBorder: underline,
            focusedBorder: underline,
            hintText: AppLocalizations.of(context)
                .translate('profile_detail.fullname_hint'),
            hintStyle: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.GREY)));
  }

  void _onNameChange() {
    _nameFormBloc.add(FullnameChanged(
      fullname: _nameController.text,
    ));
  }
}
