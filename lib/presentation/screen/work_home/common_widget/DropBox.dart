import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/model/entity/home_data.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_new/bloc/news_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_new/bloc/news_event.dart';

class DropBoxAppBar extends StatefulWidget {
  final String value;
  final List<HomeData> homeData;
  final int type;

  const DropBoxAppBar({Key key, this.type, this.value, this.homeData})
      : super(key: key);
  @override
  _DropBoxAppBarState createState() => _DropBoxAppBarState(value: type);
}

class _DropBoxAppBarState extends State<DropBoxAppBar> {
  HomeData dropdownValue;
  int value;
  _DropBoxAppBarState({this.value});
  @override
  Widget build(BuildContext context) {
    return DropdownButton<HomeData>(
      value: dropdownValue,
      hint: Text("Tất cả"),
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      underline: SizedBox(),
      style: TextStyle(color: Colors.black),
      onChanged: (HomeData newValue) {
        setState(() {
          dropdownValue = newValue;
          value = newValue.id;
          BlocProvider.of<NewsBloc>(context).add(LoadNews(value, '', ''));
          BlocProvider.of<NewsBloc>(context).add(RefreshNews(value, '', ''));
        });
      },
      items: widget.homeData.map((HomeData item) {
        return DropdownMenuItem<HomeData>(
          value: item,
          child: Text(
            item.name ?? '',
            style: TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
    );
  }
}
