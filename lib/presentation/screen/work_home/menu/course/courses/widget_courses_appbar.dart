import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';

class WidgetAppbarWithSearchCourser extends StatefulWidget {
  final String title;
  final String titleSearch;
  final List<Widget> left;
  final List<Widget> right;
  final Color indicatorColor;
  final Color backgroundColor;
  final Color textColor;
  final bool hasIndicator;

  WidgetAppbarWithSearchCourser(
      {Key key,
      this.title,
      this.left,
      this.right,
      this.indicatorColor,
      this.backgroundColor,
      this.hasIndicator = false,
      this.textColor,
      this.titleSearch})
      : super(key: key);

  @override
  _WidgetAppbarWithSearchCourserState createState() =>
      _WidgetAppbarWithSearchCourserState();
}

class _WidgetAppbarWithSearchCourserState
    extends State<WidgetAppbarWithSearchCourser> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 25),
          width: double.infinity,
          height: AppValue.ACTION_BAR_HEIGHT * 1.8,
          decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          //padding: EdgeInsets.only(top: 15),
          child: Stack(
            overflow: Overflow.visible,
            children: [
              widget.left != null
                  ? Positioned.fill(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.left,
                      ),
                    )
                  : SizedBox(),
              widget.right != null
                  ? Positioned.fill(
                      top: -5,
                      bottom: 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: widget.right,
                      ),
                    )
                  : SizedBox(),
              widget.title != null
                  ? Positioned.fill(
                      child: FractionallySizedBox(
                          widthFactor: .8,
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            child: Stack(
                              children: [
                                Container(
                                  height: AppValue.ACTION_BAR_HEIGHT * 1.25,
                                  child: Center(
                                    child: Text(
                                      widget.title,
                                      style: AppStyle.DEFAULT_MEDIUM.copyWith(
                                          color: widget.textColor != null
                                              ? widget.textColor
                                              : Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    )
                  : SizedBox(),
              Positioned(
                top: 55,
                left: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    AppNavigator.navigateSearchCourses();
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 45,
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.titleSearch != null
                                ? widget.titleSearch
                                : "Tìm kiếm",
                            style: AppStyle.DEFAULT_SMALL.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        widget.hasIndicator
            ? Divider(
                height: 1,
                thickness: 1,
                color: widget.indicatorColor != null
                    ? widget.indicatorColor
                    : Colors.grey,
              )
            : WidgetSpacer(
                height: 0,
              )
      ],
    );
  }
}
