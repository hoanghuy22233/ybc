import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';

enum TabWorkItem { home, contract, news, course, person }

class WorkFABBottomNavItem {
  WorkFABBottomNavItem(
      {this.iconData,
      this.url,
      this.assetUri,
      this.text,
      this.tabItem,
      this.navigatorKey,
      this.route});

  const WorkFABBottomNavItem.asset(
      {this.assetUri, this.text, this.tabItem, this.navigatorKey, this.route})
      : url = null,
        iconData = null;

  const WorkFABBottomNavItem.network(
      {this.url, this.text, this.tabItem, this.navigatorKey, this.route})
      : assetUri = null,
        iconData = null;

  const WorkFABBottomNavItem.icon(
      {this.iconData, this.text, this.tabItem, this.navigatorKey, this.route})
      : url = null,
        assetUri = null;

  const WorkFABBottomNavItem.center(
      {this.text, this.tabItem, this.navigatorKey, this.route})
      : url = null,
        assetUri = null,
        iconData = null;

  final String url;
  final String assetUri;
  final IconData iconData;
  final String text;
  final TabWorkItem tabItem;
  final GlobalKey<NavigatorState> navigatorKey;
  final String route;
}

class WorkWidgetFABBottomNav extends StatefulWidget {
  WorkWidgetFABBottomNav({
    this.items,
    this.centerItemText,
    this.height: 60.0,
    this.iconSize: 20.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
    this.updateIndex,
    this.selectedIndex,
  }) {
    // assert(this.items.length % 2 != 0, "Item size must be odd!");
    // assert(this.items.length <= 5, "Max size 5!");
  }

  final int selectedIndex;
  final List<WorkFABBottomNavItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;
  final Function updateIndex;

  @override
  _WidgetWorkFABBottomNavItemState createState() =>
      _WidgetWorkFABBottomNavItemState();
}

class _WidgetWorkFABBottomNavItemState extends State<WorkWidgetFABBottomNav> {
  _updateIndex(int index) {
    widget.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      if (index == widget.items.length ~/ 2) {
        return _buildMiddleTabItem();
      }
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 27,
              color: Colors.transparent,
            ),
            Text(
              widget.centerItemText ?? 'Trang ch???',
              style: AppStyle.DEFAULT_SMALL.copyWith(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    WorkFABBottomNavItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color =
        widget.selectedIndex == index ? widget.selectedColor : widget.color;

    var icon;
    if (item.url != null) {
      icon = WidgetCachedImage(
        url: item.url,
        color: color,
      );
    }
    if (item.assetUri != null) {
      icon = Image.asset(
        item.assetUri,
        color: color,
      );
    }
    if (item.iconData != null) {
      icon = Icon(item.iconData, color: color, size: widget.iconSize);
    }
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 0.3,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: icon,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  item.text,
                  style: TextStyle(color: color, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
