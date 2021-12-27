import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_search.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_work_appbar.dart';

class WidgetAppBarSearch extends StatefulWidget {
  final String title;


  const WidgetAppBarSearch({Key key, this.title, }) : super(key: key);@override
  _WidgetAppBarSearchState createState() => _WidgetAppBarSearchState();
}

class _WidgetAppBarSearchState extends State<WidgetAppBarSearch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildNavigationBar(widget.title),
        WidgetWorkSearch(),
      ],
    );
  }
  _buildNavigationBar(String title) {
    return WidgetWorkAppbar(
      title: title,
      left: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: WidgetAppbarMenuBack(),
        )
      ],
    );
  }
}

