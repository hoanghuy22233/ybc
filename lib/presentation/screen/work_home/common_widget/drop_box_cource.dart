import 'package:flutter/material.dart';

class DropBoxProject extends StatefulWidget {
  final String value;

  const DropBoxProject({Key key, this.value}) : super(key: key);
  @override
  _DropBoxProjectState createState() => _DropBoxProjectState();
}

class _DropBoxProjectState extends State<DropBoxProject> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = widget.value;
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      underline: SizedBox(),
      style: TextStyle(color: Colors.black),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items:
          <String>[dropdownValue].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
