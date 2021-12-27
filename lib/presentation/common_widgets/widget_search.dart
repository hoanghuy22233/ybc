import 'package:flutter/material.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/utils/locale/app_localization.dart';

class WidgetSearch extends StatelessWidget {
//  @override
//  _WidgetSearchState createState() => _WidgetSearchState();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.70,
      child: Card(
        elevation: 2,
        color: Colors.grey[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            Expanded(
              child: Text(
                  AppLocalizations.of(context).translate('search.search'),
                  style: TextStyle(color: AppColor.BLACK)),
            ),
          ]),
        ),
      ),
    );
  }
}

//class _WidgetSearchState extends State<WidgetSearch> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: 50,
//      width: MediaQuery.of(context).size.width * 0.70,
//      child: Card(
//        elevation: 2,
//        shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(40)),
//        child: Padding(
//          padding: const EdgeInsets.symmetric(horizontal: 25),
//          child: Row(children: [
//            Image.asset(
//              "assets/images/search_home.png",
//              height: 20,
//              width: 20,
//            ),
//            Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 10),
//            ),
//            Expanded(
//              child: Text(
//                  AppLocalizations.of(context)
//                      .translate('search.search'),
//                  style: TextStyle(color: AppColor.GREY)),
//            ),
//          ]),
//        ),
//      ),
//    );
//  }
//}
