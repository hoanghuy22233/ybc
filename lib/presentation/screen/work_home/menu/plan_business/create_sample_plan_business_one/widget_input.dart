import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class WidgetInput extends StatefulWidget {
  final TextEditingController inputController;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final String hint;
  final bool obscureText;
  final bool autovalidate;
  final bool bigSize;
  final TextInputType inputType;

  WidgetInput(
      {this.inputController,
      this.onChanged,
      this.validator,
      this.hint,
      this.inputType = TextInputType.text,
      this.obscureText = false,
      this.autovalidate = false,
      this.bigSize = false});

  @override
  _WidgetInputState createState() => _WidgetInputState();
}

class _WidgetInputState extends State<WidgetInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
        height: widget.bigSize ? 150:  AppValue.INPUT_FORM_HEIGHT,
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: widget.inputController,
                      onChanged: (change) {
                        widget.onChanged(change);
                      },
                      autovalidateMode: widget.autovalidate ?? false ? AutovalidateMode.always : AutovalidateMode.disabled,
                      validator: widget.validator,
                      style: AppStyle.DEFAULT_MEDIUM,
                      maxLines: widget.bigSize ? 5 : 1,
                      minLines: widget.bigSize ? 5 : 1,
                      keyboardType: widget.inputType ?? TextInputType.text,
                      textAlign: TextAlign.left,
                      obscureText: widget.obscureText,
                      decoration: InputDecoration.collapsed(
                        hintText: widget.hint,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    ));
  }
}
