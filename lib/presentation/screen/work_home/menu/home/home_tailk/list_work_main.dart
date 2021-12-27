import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/home_tailk/list_work_one.dart';

class ChildWorkMain extends StatefulWidget {
  final HomeData homeData;

  final Function(HomeData, int) onCategoryClick;
  ChildWorkMain({this.homeData, this.onCategoryClick});
  @override
  _ChildWorkMainState createState() => _ChildWorkMainState();
}

class _ChildWorkMainState extends State<ChildWorkMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () {
                widget.onCategoryClick(widget.homeData, widget.homeData.id);
              },
              child: _buildText(widget.homeData?.name ?? '', 'Xem thêm',
                  widget.homeData, widget.homeData.id, widget.homeData.name),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ChildWorkOne(
                  post: widget.homeData.post[index],
                );
              },
              separatorBuilder: (context, index) {
                return WidgetSpacer(width: 5);
              },
              //   physics: BouncingScrollPhysics(),
              itemCount: widget.homeData.post.length,
            ),
          )
        ],
      ),
    );
  }

  // _buildText(String first, String last) {
  _buildText(
      String first, String last, HomeData homeDatas, int id, String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            first,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () {
              //   AppNavigator.navigateNavigationCategoryDetail(categoryId: id, title: title);
              widget.onCategoryClick(homeDatas, id);
              // BlocProvider.of<NewsCategoryBloc>(context)
              //     .add(RefreshNewsCategory(widget.homeData.id));
            },
            child: Row(
              children: [
                Text(
                  last,
                  style: TextStyle(
                    color: AppColor.WORK_COLOR,
                    fontSize: 12,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 14,
                  color: Colors.blue[500],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
