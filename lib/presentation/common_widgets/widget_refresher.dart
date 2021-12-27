import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/common_widgets/widget_refresher_no_more.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WidgetRefresher extends StatefulWidget {
  final Widget child;
  final Widget customHeader;
  final Widget customFooter;
  final RefreshController refreshController;
  final Function onLoading;
  final Function onRefresh;
  final Axis scrollDirection;
  final ScrollPhysics physics;

  const WidgetRefresher(
      {Key key,
      this.customHeader,
      this.customFooter,
      this.refreshController,
      this.onLoading,
      this.onRefresh,
      this.child,
      this.scrollDirection,
      this.physics})
      : super(key: key);

  @override
  _WidgetRefresherState createState() => _WidgetRefresherState();
}

class _WidgetRefresherState extends State<WidgetRefresher> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        physics: widget.physics ?? widget.physics,
        header: widget.customHeader != null
            ? widget.customFooter
            : ClassicHeader(
                idleText: '',
                releaseText: '',
              ),
        footer: widget.customFooter != null
            ? widget.customFooter
            : CustomFooter(
                builder: (BuildContext context, LoadStatus mode) {
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = Text('');
                  } else if (mode == LoadStatus.loading) {
                    body = WidgetRefresherLoading();
                  } else if (mode == LoadStatus.failed) {
                    body = WidgetCircleProgress();
                  } else if (mode == LoadStatus.canLoading) {
                    body = Text('canLoading');
                  } else {
                    body = WidgetRefresherNoMore();
                  }
                  return Container(
                    child: Center(child: body),
                  );
                },
              ),
        controller: widget.refreshController,
        onRefresh: widget.onRefresh,
        onLoading: widget.onLoading,
        scrollDirection: widget.scrollDirection != null
            ? widget.scrollDirection
            : Axis.horizontal,
        child: widget.child,
      ),
    );
  }
}
