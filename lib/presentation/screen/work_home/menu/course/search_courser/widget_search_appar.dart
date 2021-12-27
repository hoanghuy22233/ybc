import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';

class WidgetSearchAppbar extends StatefulWidget {
  final List<Widget> title;
  final List<Widget> left;
  final List<Widget> right;
  final Color indicatorColor;
  final Color backgroundColor;
  final bool hasIndicator;
  final Color textColor;

  WidgetSearchAppbar(
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
  _WidgetSearchAppbar createState() => _WidgetSearchAppbar();
}

class _WidgetSearchAppbar extends State<WidgetSearchAppbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: AppValue.ACTION_BAR_HEIGHT * 2,
          color: widget.backgroundColor,
          padding: EdgeInsets.only(top: 20),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: widget.title,
                      ),
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
