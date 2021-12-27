import 'package:flutter/cupertino.dart';
import 'package:ybc/model/entity/news.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_new/widget_news.dart';

class WidgetListNews extends StatefulWidget {
  final List<News> news;
  WidgetListNews({this.news});

  @override
  _WidgetListNewsState createState() => _WidgetListNewsState();
}

class _WidgetListNewsState extends State<WidgetListNews> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return WidgetNews(
          news: widget.news[index],
        );
      },
//                  itemExtent: 100.0,
      itemCount: widget.news.length,
      separatorBuilder: (context, index) {
        return WidgetSpacer(width: 1);
      },
      physics: BouncingScrollPhysics(),
    );
  }
}
