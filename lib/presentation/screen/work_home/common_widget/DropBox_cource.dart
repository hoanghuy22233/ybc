import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/model/entity/category_courser.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/bloc/courses_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/bloc/courses_event.dart';

class DropBox extends StatefulWidget {
  final String value;
  final List<CategoryCourser> courser;
  final int type;

  const DropBox({Key key, this.type, this.value, this.courser})
      : super(key: key);
  @override
  _DropBoxState createState() => _DropBoxState(value: type);
}

class _DropBoxState extends State<DropBox> {
  CategoryCourser dropdownValue;
  int value;
  _DropBoxState({this.value});
  @override
  Widget build(BuildContext context) {
    return DropdownButton<CategoryCourser>(
      value: dropdownValue,
      hint: Text("Tất cả"),
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      underline: SizedBox(),
      style: TextStyle(color: Colors.black),
      onChanged: (CategoryCourser newValue) {
        setState(() {
          dropdownValue = newValue;
          value = newValue.id;
          BlocProvider.of<CoursesBloc>(context).add(LoadCourses(value, '', ''));
          BlocProvider.of<CoursesBloc>(context)
              .add(RefreshCourses(value, '', ''));
        });
      },
      items: widget.courser.map((CategoryCourser wallet) {
        return DropdownMenuItem<CategoryCourser>(
          value: wallet,
          child: Text(
            wallet.name ?? '',
            style: TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
    );
  }
}
