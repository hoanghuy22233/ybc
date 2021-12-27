import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:ybc/model/entity/courses_detail.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_title.dart';

class TabIntro extends StatelessWidget {
  final CourseDetail courseDetail;

  const TabIntro({Key key, this.courseDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetWorkTitle(
              title: 'Giới thiệu',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: courseDetail.intro != null
                  ? HtmlWidget('${courseDetail.intro}')
                  : Container(),
            ),
            WidgetWorkTitle(
              title: 'Thông tin giảng viên',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: courseDetail.intro != null
                  ? HtmlWidget('${courseDetail.intro}')
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
