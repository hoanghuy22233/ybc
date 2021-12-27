import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';

class WidgetWorkHomeAppbar extends StatefulWidget {
  final String title;
  final List<Widget> left;
  final List<Widget> right;
  final Color indicatorColor;
  final Color backgroundColor;
  final bool hasIndicator;
  final Color textColor;

  WidgetWorkHomeAppbar(
      {Key key,
      this.title,
      this.left,
      this.right,
      this.indicatorColor,
      this.backgroundColor,
      this.textColor,
      this.hasIndicator = false})
      : super(key: key);

  @override
  _WidgetWorkHomeAppbar createState() => _WidgetWorkHomeAppbar();
}

class _WidgetWorkHomeAppbar extends State<WidgetWorkHomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: AppValue.ACTION_BAR_HEIGHT * 1.5,
          color: widget.backgroundColor,
          padding: EdgeInsets.only(top: 15),
          child: Stack(
            overflow: Overflow.visible,
            children: [
              widget.left != null
                  ? Positioned.fill(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: widget.left,
                      ),
                    )
                  : SizedBox(),
              widget.right != null
                  ? Positioned.fill(
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
