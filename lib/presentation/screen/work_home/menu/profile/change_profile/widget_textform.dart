import 'package:flutter/material.dart';

class WidgetTextFormFiled extends StatefulWidget {
  final String text;

  WidgetTextFormFiled(this.text);

  @override
  _WidgetTextFormFiledState createState() => _WidgetTextFormFiledState();
}

class _WidgetTextFormFiledState extends State<WidgetTextFormFiled> {
  TextEditingController _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey.withOpacity(0.2)
      ),
      child: TextFormField(

        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        controller: _textEditingController,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          labelText: widget.text,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
          suffixIcon: GestureDetector(
            onTap: (){
              _textEditingController.clear();
            },
            child: Icon(Icons.highlight_remove,
                color: Colors.grey,
                size: 20),
          ),
        ),
      ),
    );
  }
}
