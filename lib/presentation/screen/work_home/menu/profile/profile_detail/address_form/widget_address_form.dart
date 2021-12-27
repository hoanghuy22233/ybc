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

import 'bloc/address_form_bloc.dart';
import 'bloc/address_form_event.dart';
import 'bloc/address_form_state.dart';

class WidgetAddressForm extends StatefulWidget {
  final String address;
  final Function onCloseTap;

  const WidgetAddressForm(
      {Key key, @required this.onCloseTap, @required this.address})
      : super(key: key);

  @override
  _WidgetAddressFormState createState() => _WidgetAddressFormState();
}

class _WidgetAddressFormState extends State<WidgetAddressForm> {
  AddressFormBloc _addressFormBloc;
  final TextEditingController _addressController = TextEditingController();

  final underline = new UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.GREY,
    ),
  );

  @override
  void initState() {
    super.initState();
    _addressFormBloc = BlocProvider.of<AddressFormBloc>(context);
    _addressController.text = widget.address ?? '';
    _addressController.addListener(_onPhoneAddress);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressFormBloc, AddressFormState>(
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
      child: BlocBuilder<AddressFormBloc, AddressFormState>(
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
                      "Địa chỉ cụ thể",
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

  bool get isPopulated => _addressController.text.isNotEmpty;

  bool isSubmitButtonEnabled() {
    return _addressFormBloc.state.isFormValid &&
        isPopulated &&
        !_addressFormBloc.state.isSubmitting;
  }

  _buildButtonSubmit() {
    return WidgetButton(
      height: 45,
      onTap: () {
        if (isSubmitButtonEnabled()) {
          _addressFormBloc.add(AddressFormSubmitEvent(
            address: _addressController.text.trim(),
          ));
        }
      },
      text: AppLocalizations.of(context).translate('profile_detail.update'),
    );
  }

  _buildTextFieldAdress() {
    return TextFormField(
        controller: _addressController,
        validator: (_) {
          print('validator');
          return !_addressFormBloc.state.isAddressValid ? '' : null;
        },
        style: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.PRIMARY),
        maxLines: 1,
        decoration: InputDecoration(
            disabledBorder: underline,
            enabledBorder: underline,
            focusedBorder: underline,
            hintText: "Nhập địa chỉ cụ thể",
            hintStyle: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.GREY)));
  }

  void _onPhoneAddress() {
    _addressFormBloc.add(AddressChanged(
      address: _addressController.text,
    ));
  }
}
