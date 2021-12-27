import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/model/entity/courses.dart';
import 'package:ybc/presentation/common_widgets/widget_cached_image.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courser_detail/sc_courser_detail.dart';

class WidgetCourser extends StatelessWidget {
  final Courses courses;

  const WidgetCourser({Key key, this.courses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double count =
        (((courses.basePrice - courses.finalPrice) * 100) / courses.basePrice);
    return GestureDetector(
      onTap: () {
        //     AppNavigator.navigateCourserDetail(courses.id);
        _openDetailsPage(context);
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: AspectRatio(
                    aspectRatio: AppValue.NEWS_IMAGE_RATIO,
                    child: WidgetCachedImage(
                      url: courses.image,
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(7))),
                    child: count != null
                        ? Text(
                            '-' + count.floor().toString() + '%',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        : Container(),
                  ),
                )
              ],
            ),
            courses?.name != null
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Container(
                        child: Text(
                      courses.name.length <= 40
                          ? courses.name
                          : courses.name.substring(0, 40) + '...',
                      maxLines: 2,
                      style: AppStyle.DEFAULT_SMALL.copyWith(
                          color: AppColor.BLACK, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    )),
                  )
                : Container(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.blue,
                    size: 20,
                  ),
                  courses?.lecturer?.name != null
                      ? Container(
                          child: Text(
                          courses.lecturer.name.length <= 15
                              ? courses.lecturer.name
                              : courses.lecturer.name.substring(0, 15) + '...',
                          style: AppStyle.DEFAULT_SMALL
                              .copyWith(color: AppColor.GREY),
                          textAlign: TextAlign.start,
                        ))
                      : Text("admin")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Wrap(
                alignment: WrapAlignment.start,
                children: [
                  courses.finalPrice != null
                      ? Text(
                          '${AppValue.APP_MONEY_FORMAT.format(courses.finalPrice)}',
                          style: AppStyle.PRODUCT_SALE_PRICE,
                        )
                      : SizedBox(),
                  WidgetSpacer(
                    height: 0,
                    width: 10,
                  ),
                  courses.finalPrice != null
                      ? Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 2,
                          ),
                          child: Text(
                            '${AppValue.APP_MONEY_FORMAT.format(courses.basePrice)}',
                            style: AppStyle.PRODUCT_PRICE,
                          ),
                        )
                      : Text(
                          '${AppValue.APP_MONEY_FORMAT.format(courses.basePrice)}',
                          style: AppStyle.PRODUCT_SALE_PRICE,
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _openDetailsPage(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CourserDetailScreen(
                id: courses.id,
              )));
}
