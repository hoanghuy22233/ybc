import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BHColors.dart';

Widget textFieldWidget(String hintText, TextEditingController controller,
    {bool obscureText = false, bool isPassword = true}) {
  return TextFormField(
    obscureText: isPassword,
    style: TextStyle(color: Colors.black),
    controller: controller,
    decoration: InputDecoration(
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      labelText: hintText,
      labelStyle: TextStyle(color: Colors.grey),
      suffixIcon: GestureDetector(
        onTap: () {
          isPassword = !isPassword;
        },
        child: Icon(
          isPassword ? Icons.visibility_off : Icons.visibility,
          color: Colors.black,
        ),
      ),
    ),
  );
}

Widget raiseButton({String btnText}) {
  return Container(
    width: 130,
    child: RaisedButton(
      padding: EdgeInsets.all(8),
      onPressed: () {},
      color: Colors.white,
      shape: RoundedRectangleBorder(side: BorderSide(color: BHGreyColor)),
      child: Text(
        btnText,
        style: TextStyle(
          color: BHAppTextColorSecondary,
          fontSize: 15,
        ),
      ),
    ),
  );
}

Widget raiseButton1(String btnText1) {
  return RaisedButton(
    padding: EdgeInsets.all(12),
    onPressed: () {},
    color: BHColorPrimary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Text(
      btnText1,
      style: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
    ),
  );
}

// ignore: must_be_immutable
class EditTextFieldWidget extends StatefulWidget {
  static String tag = '/EditTextFieldWidget';

  String hintText = '';
  TextEditingController controller;
  bool isPassword;
  bool showPassword = false;

  EditTextFieldWidget({this.hintText, this.controller, this.showPassword});

  @override
  EditTextFieldWidgetState createState() => EditTextFieldWidgetState();
}

class EditTextFieldWidgetState extends State<EditTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(color: Colors.black),
      // obscureText: !showPassword,
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        labelText: widget.hintText,
        labelStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
