import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class WidgetLoginInput extends StatefulWidget {
  final TextEditingController inputController;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final String hint;
  final int maxLine;
  final int minLine;
  final double height;
  final bool obscureText;
  final bool autovalidate;
  final TextInputType inputType;
  final Widget endIcon;

  WidgetLoginInput(
      {this.inputController,
      this.onChanged,
      this.validator,
      this.hint,
      this.inputType = TextInputType.text,
      this.obscureText = false,
      this.autovalidate = false,
      this.endIcon,
      this.maxLine=1,
      this.minLine=1,
      this.height,
      });

  @override
  _WidgetLoginInputState createState() => _WidgetLoginInputState();
}

class _WidgetLoginInputState extends State<WidgetLoginInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
          height: widget.height != null ? widget.height : AppValue.INPUT_FORM_HEIGHT,
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
                  Expanded(
                    flex: 9,
                    child: TextFormField(
                      controller: widget.inputController,
                      onChanged: (change) {
                        widget.onChanged(change);
                      },
                      autovalidateMode: widget.autovalidate ?? false ? AutovalidateMode.always : AutovalidateMode.disabled,
                      validator: widget.validator,
                      style: AppStyle.DEFAULT_MEDIUM,
                      maxLines: widget.maxLine,
                      minLines: widget.minLine,
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
