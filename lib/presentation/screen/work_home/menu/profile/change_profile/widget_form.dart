import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/change_profile/widget_textform.dart';

class WidgetFormProfileDetail extends StatefulWidget {
  @override
  _WidgetFormProfileDetailState createState() =>
      _WidgetFormProfileDetailState();
}

class _WidgetFormProfileDetailState extends State<WidgetFormProfileDetail> {
  bool valuefirst = false;
  bool valueSecond = false;

  @override
  Widget build(BuildContext context) {
    bool checked;
    return Column(
      children: [
        WidgetTextFormFiled("Họ và tên"),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.blue,
              value: this.valuefirst,
              onChanged: (bool value) {
                setState(() {
                  valuefirst = true;
                  valueSecond = false;
                });
              },
            ),
            Text(
              "Nam",
              style: TextStyle(color: Colors.grey),
            ),
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.blue,
              value: this.valueSecond,
              onChanged: (bool value) {
                setState(() {
                  valueSecond = true;
                  valuefirst = false;
                });
              },
            ),
            Text(
              'Nữ',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        WidgetTextFormFiled("Ngày sinh"),
        SizedBox(
          height: 15,
        ),
        WidgetTextFormFiled("Số điện thoại"),
        SizedBox(
          height: 15,
        ),
        WidgetTextFormFiled("Email"),
        SizedBox(
          height: 15,
        ),
        WidgetTextFormFiled("Tỉnh/ Thành phố"),
        SizedBox(
          height: 15,
        ),
        WidgetTextFormFiled("Quận/ Huyện"),
        SizedBox(
          height: 15,
        ),
        WidgetTextFormFiled("Phường/ Xã"),
        SizedBox(
          height: 15,
        ),
        WidgetTextFormFiled("Địa chỉ cụ thể"),
        SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(25)),
          child: TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            maxLines: 5,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: InputBorder.none,
              // floatingLabelBehavior:FloatingLabelBehavior.auto,

              labelText: "Lời giới thiệu",
              //hintText: "Lời giới thiệu",

              labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
