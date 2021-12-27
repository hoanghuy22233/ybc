import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/model/entity_offline/work/newsItem.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_news_listview.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_title.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_work_add_appbar.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_work_appbar.dart';

class DetailNewsScreen extends StatelessWidget {
  final int id;

  const DetailNewsScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Stack(
              children: [
                WidgetWorkAppbar(
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  title: 'Chi tiết',
                ),
                Column(
                  children: [
                    // WidgetWorkAppbar(
                    //   backgroundColor: Colors.blue,
                    //   textColor: Colors.white,
                    //   title: 'Chi tiết tin tức',
                    // ),
                    // _buildAppbar("Chi tiết tin tức"),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 100),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          '${allNewsItem[id].image}',
                                          fit: BoxFit.cover,
                                        )),
                                    WidgetWorkTitle(
                                      title: '${allNewsItem[id].title}',
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 25, left: 25, bottom: 15),
                                      child: Text('${allNewsItem[id].time}'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text('${allNewsItem[id].content}'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: WidgetWorkTitle(
                                title: 'Tin tức liên quan',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            _buildListView(),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            WidgetWorkAddAppbar(
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              title: 'Chi tiết tin tức',
              left: [
                WidgetAppbarMenuBack(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

_buildListView() => WidgetNewsListView();
