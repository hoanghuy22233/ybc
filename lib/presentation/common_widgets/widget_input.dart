import 'package:flutter/material.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';

class WidgetInput extends StatefulWidget {
  final TextEditingController inputController;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final String hint;
  final int maxLength;
  final String labelText;
  final bool obscureText;
  final bool autovalidate;
  final TextInputType inputType;
  final Widget endIcon;
  final Widget leadIcon;

  WidgetInput(
      {this.inputController,
        this.onChanged,
        this.validator,
        this.hint,
        this.labelText,
        this.maxLength,
        this.inputType = TextInputType.text,
        this.obscureText = false,
        this.autovalidate = false,
        this.endIcon,
        this.leadIcon});

  @override
  _WidgetInputState createState() => _WidgetInputState();
}

class _WidgetInputState extends State<WidgetInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
          height: AppValue.INPUT_FORM_HEIGHT,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 0.5,
                    color: Colors.grey
                ),
                borderRadius: BorderRadius.circular(25)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 15),
              child: Row(
                children: [
                  widget.leadIcon != null ?
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Container(
                        height: 20,
                        width: 20,
                        child: widget.leadIcon
                    ),
                  ) : SizedBox(),
                  Expanded(
                    flex: 7,
                    child: TextFormField(
                      controller: widget.inputController,
                      onChanged: (change) {
                        widget.onChanged(change);
                      },
                      autovalidate: widget.autovalidate ?? false,
                      validator: widget.validator,
                      style: AppStyle.DEFAULT_MEDIUM,
                      maxLength: widget.maxLength,
                      maxLengthEnforced: false,
                      maxLines: 1,
                      keyboardType: widget.inputType ?? TextInputType.text,
                      textAlign: TextAlign.left,
                      obscureText: widget.obscureText,
                      decoration: InputDecoration.collapsed(
                        hintText: widget.hint,
                      ),
                    ),
                  ),
                  widget.endIcon != null ?
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                        height: 20,
                        width: 20,
                        child: widget.endIcon
                    ),
                  ) : SizedBox(),
                ],
              ),
            ),
          ),
        ));
  }
}
