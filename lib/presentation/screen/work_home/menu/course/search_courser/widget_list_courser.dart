import 'package:flutter/cupertino.dart';
import 'package:ybc/model/entity/courses.dart';
import 'package:ybc/model/entity/news.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/widget_courses.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_new/widget_news.dart';

class WidgetListCourses extends StatefulWidget {
  final List<Courses> courses;
  WidgetListCourses({this.courses});

  @override
  _WidgetListCoursesState createState() => _WidgetListCoursesState();
}

class _WidgetListCoursesState extends State<WidgetListCourses> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //padding: EdgeInsets.symmetric(horizontal: 0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      scrollDirection: Axis.vertical,
      itemCount: widget.courses.length,
      itemBuilder: (context, index) {
        return Container(
          child: WidgetCourser(
            courses: widget.courses[index],
          ),
        );
      },
    );
  }
}
