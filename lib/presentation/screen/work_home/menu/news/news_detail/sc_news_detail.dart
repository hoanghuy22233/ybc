import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_title.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_work_add_appbar.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_work_appbar.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_detail/appbar_new_detail.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_detail/bloc/news_detail_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_detail/bloc/news_detail_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_detail/bloc/news_detail_state.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_detail/widget_news_horizontal.dart';

class NewsDetailScreen extends StatefulWidget {
  final int id;
  NewsDetailScreen({this.id});
  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  int _newsId;
  ScrollController _scrollController;

  _onArgument() {
    Future.delayed(Duration.zero, () async {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      setState(() {
        _newsId = arguments['news_id'];
        print('---news_id: $_newsId---');

        BlocProvider.of<NewsDetailBloc>(context).add(LoadNewsDetail(_newsId));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    //  _onArgument();
    BlocProvider.of<NewsDetailBloc>(context).add(RefreshNewsDetail(widget.id));
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backButton();
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      controller: _scrollController,
                      child: BlocBuilder<NewsDetailBloc, NewsDetailState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              _buildContents(state),
                              Container(
                                height: 200,
                                child: _buildContent(state),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              WidgetWorkAddAppbar(
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                title: 'Chi tiết tin tức',
                left: [
                  SizedBox(
                    width: 10,
                  ),
                  WidgetAppbarMenuBackNewsDetail(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContents(NewsDetailState state) {
    if (state is NewsDetailLoaded) {
      var news = state.news;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 80),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          '${state?.news?.item?.image ?? ''}',
                          fit: BoxFit.cover,
                        ),
                      )),
                  WidgetWorkTitle(
                    title: '${state?.news?.item?.name ?? ''}',
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 25, left: 25, bottom: 15),
                    child: Text('${state?.news?.item?.createdAt ?? ''}'),
                  ),
                ],
              ),
            ),
          ),
          state.news.item.content != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: HtmlWidget(
                        state?.news?.item?.content ?? '',
                      ),
                    ),
                  ),
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          state.news.relate != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: WidgetWorkTitle(
                    title: 'Tin tức liên quan',
                  ),
                )
              : Container(),
          // _buildListView(),
        ],
      );
    } else if (state is NewsDetailLoading) {
      return SizedBox(
        width: Get.width,
        height: Get.height - AppValue.ACTION_BAR_HEIGHT,
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            child: Lottie.asset(
              'assets/lottie/trail_loading.json',
            ),
          ),
        ),
      );
    } else if (state is NewsDetailNotLoaded) {
      return WidgetScreenError(
        status: state.status,
        inScroll: true,
      );
    } else {
      return Center(
        child: Text('Unknown state'),
      );
    }
  }

  Widget _buildContent(NewsDetailState state) {
    if (state is NewsDetailLoaded) {
      var news = state.news;
      return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return WidgetNewsHorizontal(news: state.news.relate.data[index]);
        },
//                  itemExtent: 100.0,
        itemCount: state.news.relate.data.length,
        separatorBuilder: (context, index) {
          return WidgetSpacer(height: 15);
        },
        physics: BouncingScrollPhysics(),
      );
    } else if (state is NewsDetailLoading) {
      return SizedBox(
        width: Get.width,
        height: Get.height - AppValue.ACTION_BAR_HEIGHT,
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            child: Lottie.asset(
              'assets/lottie/trail_loading.json',
            ),
          ),
        ),
      );
    } else if (state is NewsDetailNotLoaded) {
      return WidgetScreenError(
        status: state.status,
        inScroll: true,
      );
    } else {
      return Center(
        child: Text('Unknown state'),
      );
    }
  }

  void backButton() {
    AppNavigator.popToNews();
  }
}
