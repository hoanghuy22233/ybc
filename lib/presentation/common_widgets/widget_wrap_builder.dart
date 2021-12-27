import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetWrapBuilder extends StatelessWidget {
  WidgetWrapBuilder.build(
      {Key key,
        this.header,
        this.footer,
        @required this.itemBuilder,
        @required this.data})
      : assert(itemBuilder != null),
        assert(data != null),
        super(key: key);

  final Widget header;
  final Widget footer;

  final List data;
  final Function itemBuilder;
  @override
  Widget build(BuildContext context) {
    return _wrapList(context);
  }

  Widget _wrapList(BuildContext context) {
    List<Widget> _wList = List();
    if (header != null) _wList.add(header);
    int index = 0;
    data.forEach((item) {
      _wList.add(itemBuilder(data, context, index));
      index++;
    });
    if (data.length % 3 == 1)
      _wList.add(itemBuilder(null, context, index));
    if (footer != null) _wList.add(footer);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.center,
        direction: Axis.horizontal,
        children: _wList,
      ),
    );
  }
}

