import 'package:flutter/material.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/DropBox.dart';

class WidgetWorkSearch extends StatefulWidget {
  @override
  _WidgetWorkSearch createState() => _WidgetWorkSearch();
}

class _WidgetWorkSearch extends State<WidgetWorkSearch> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue;
    return Stack(alignment: Alignment.topCenter, children: [
      Container(
        color: Colors.grey[300],
        height: (AppValue.ACTION_BAR_HEIGHT * 2 - 5),
      ),
      Container(
        decoration: BoxDecoration(
            color: AppColor.WORK_COLOR,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        height: (AppValue.ACTION_BAR_HEIGHT / 2),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 5),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Center(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Image.asset(
                        "assets/images/img_search.png",
                        width: 20,
                        height: 25,
                      ),
                    ),
                    Text(" "),
                    Container(
                      width: 1,
                      height: 20,
                      color: Colors.grey[300],
                    ),
                    Text("  "),
                    Expanded(
                      child: Text("Tìm kiếm tin tức"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 35,
              child: Row(
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
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/ic_grid.png',
                    height: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue = 'Sắp xếp theo',
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
              ),
            )
          ],
        ),
      ),
    ]);
  }

  _builDropBox(String value) => DropBoxAppBar(
        value: value,
      );
}
