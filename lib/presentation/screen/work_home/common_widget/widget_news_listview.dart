import 'package:flutter/cupertino.dart';
import 'package:ybc/model/entity_offline/work/businessmen_items.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/businessmen_listview.dart';

class WidgetNewsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allBusiness.length,
        itemBuilder: (context, index) {
          return Container(
            child: BusinessmenListView(
              id: index,
            ),
          );
        },
      ),
    );
  }
}
