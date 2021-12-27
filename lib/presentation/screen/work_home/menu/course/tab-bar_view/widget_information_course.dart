import 'package:flutter/material.dart';
import 'package:ybc/model/entity/courses_detail.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_title.dart';

class TabInfomation extends StatelessWidget {
  final CourseDetail courseDetail;

  const TabInfomation({Key key, this.courseDetail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            courseDetail?.content != null
                ? WidgetWorkTitle(
                    title: courseDetail.content,
                  )
                : Container(),
            // _buildContentCourse(),
            // WidgetWorkTitle(
            //   title: 'Chương 2: Giới thiệu',
            // ),
            // _buildContentCourse(),
            // WidgetWorkTitle(
            //   title: 'Chương 3: Giới thiệu',
            // ),
            // _buildContentCourse(),
          ],
        ),
      ),
    );
  }

  _buildContentCourse() {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.play_circle_outline,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Bài 1',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.play_circle_outline,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Bài 2',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.play_circle_outline,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Bài 3',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.play_circle_outline,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Bài 4',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.play_circle_outline,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Bài 5',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    ));
  }
}
