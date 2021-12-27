import 'package:flutter/material.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';

class WidgetAppbarMenu extends StatefulWidget {
  final Color backgroundColor;
  final Function onTap;
  final Widget icon;
  final int badge;
  final Color badgeBackground;
  final double factor;

  WidgetAppbarMenu(
      {Key key,
      this.backgroundColor,
      this.onTap,
      this.icon,
      this.badge,
      this.factor,
      this.badgeBackground})
      : super(key: key);

  @override
  _WidgetAppbarMenuState createState() => _WidgetAppbarMenuState();
}

class _WidgetAppbarMenuState extends State<WidgetAppbarMenu> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          Positioned.fill(
            child: FractionallySizedBox(
              widthFactor: widget.factor ?? 0.6,
              heightFactor: widget.factor ?? 0.6,
              child: Container(
                height: double.infinity,
                color: widget.backgroundColor,
                child: widget.icon,
              ),
            ),
          ),
          widget.badge != null
              ? WidgetBadge(
                  badge: widget.badge,
                )
              : SizedBox(),
          Positioned.fill(
              child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(500),
                onTap: widget.onTap,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
