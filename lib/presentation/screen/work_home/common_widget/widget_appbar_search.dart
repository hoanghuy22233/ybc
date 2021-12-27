import 'package:flutter/material.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/DropBox.dart';
class WidgetAppBarSearch extends StatefulWidget {
  @override
  _WidgetAppBarSearchState createState() => _WidgetAppBarSearchState();
}

class _WidgetAppBarSearchState extends State<WidgetAppBarSearch> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue;
    return  Stack(alignment: Alignment.topCenter, children: [
      Container(
        decoration: BoxDecoration(
            color: AppColor.WORK_COLOR,
            borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(25))),
        height: (AppValue.ACTION_BAR_HEIGHT / 2),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: (AppValue.ACTION_BAR_HEIGHT ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.blueAccent,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, size: 15,),
                  hintText: 'Tìm kiếm theo chủ đề',
                  hintStyle: TextStyle(
                      fontSize: 16
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: _builDropBox('Tất cả'),
                  ),),
                SizedBox(width: 10,),
                Image.asset('assets/images/ic_grid.png', height: 15,),
                SizedBox(width: 10,),
                DropdownButton<String>(
                  value: dropdownValue='Sắp xếp theo',
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  underline: SizedBox(),
                  style: TextStyle(color: Colors.black),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>[dropdownValue]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ],
            )
          ],
        ),
      ),

    ]);
  }
  _builDropBox(String value) => DropBoxAppBar(value: value,);
}
