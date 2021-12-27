import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:flutter/material.dart';

class WidgetAddressInput extends StatefulWidget {
  final String text;
  final String hint;
  final TextEditingController controller;
  final String validatorText;
  final bool validator;
  final TextInputType inputType;
  final String initialValue;
  final ValueChanged<String> onChange;

  const WidgetAddressInput(
      {Key key,
      this.text,
      this.hint,
      this.controller,
      this.validatorText,
      this.validator = true,
      this.inputType,
      this.initialValue,
      this.onChange})
      : super(key: key);

  @override
  _WidgetAddressInputState createState() => _WidgetAddressInputState();
}

class _WidgetAddressInputState extends State<WidgetAddressInput> {
  final underline = new UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.GREY,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: AppStyle.DEFAULT_SMALL,
          ),
          TextFormField(
              initialValue: widget.initialValue,
              controller: widget.controller,
              onChanged: widget.onChange,
              autovalidateMode: AutovalidateMode.always,
              maxLines: 1,
              keyboardType: widget.inputType ?? TextInputType.text,
              textAlign: TextAlign.left,
              validator: (a) {
                return !widget.validator ? widget.validatorText : '';
              },
              style: AppStyle.DEFAULT_MEDIUM,
              decoration: InputDecoration(
                  disabledBorder: underline,
                  enabledBorder: underline,
                  focusedBorder: underline,
                  errorBorder: underline,
                  focusedErrorBorder: underline,
                  hintText: widget.hint,
                  hintStyle:
                      AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.GREY)))
        ],
      ),
    );
  }
}
