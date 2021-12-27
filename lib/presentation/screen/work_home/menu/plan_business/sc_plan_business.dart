import 'package:flutter/material.dart';
import 'package:ybc/model/entity/category_menu.dart';
import 'package:ybc/model/entity_offline/work/planItem.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/drop_box_cource.dart';
import 'package:ybc/presentation/screen/work_home/menu/plan_business/plan_business_listview.dart';
import 'package:ybc/presentation/screen/work_home/menu/plan_business/widget_appbar_with_search_business.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/widget_cart_appbar_menu.dart';


// class MyPlanBusiness extends StatelessWidget {
//   MenuCategories category;
//
//   MyPlanBusiness({this.category});
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: Brightness.light,
//         primaryColor: AppColor.PRIMARY_COLOR,
//         accentColor: AppColor.PRIMARY_COLOR,
//         hoverColor: AppColor.PRIMARY_COLOR,
//         fontFamily: 'Montserrat',
//       ),
//       navigatorObservers: [],
//       home: PlanBusinessScreen(
//         category: category,
//       ),
//     );
//   }
// }

class PlanBusinessScreen extends StatefulWidget {
  MenuCategories category;

  PlanBusinessScreen({this.category});
  @override
  _PlanBusinessScreenState createState() => _PlanBusinessScreenState();
}

class _PlanBusinessScreenState extends State<PlanBusinessScreen> {
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            _buildAppbar(
                "Mẫu kế hoạch kinh doanh", "Tìm kiếm theo ngành hoặc tác giả"),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 0, left: 10, right: 10),
                scrollDirection: Axis.vertical,
                itemCount: planBusinessItem.length,
                itemBuilder: (context, index) {
                  return PlanBusinessListView(
                    id: index,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAppbar(String title, String titleSearch) =>
      WidgetAppbarWithSearchBusiness(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        title: title,
        titleSearch: titleSearch,
        right: [
          WidgetCartAppBarMenu()
        ],
      );

  _builDropBox(String value) => DropBoxProject(
        value: value,
      );
}
