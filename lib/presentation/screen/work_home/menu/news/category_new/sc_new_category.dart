import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ybc/model/entity/category_menu.dart';
import 'package:ybc/model/entity/home_data.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/DropBox.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_appbar_with_search.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/category_new/bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_new/widget_news.dart';
import 'package:ybc/utils/handler/http_handler.dart';

class NewsCategoryScreen extends StatefulWidget {
  // final int id;
  // NewsCategoryScreen({this.id});

  MenuCategories category;
  HomeData homeData;
  int id;

  NewsCategoryScreen({this.category, this.homeData, this.id});
  @override
  _NewsCategoryScreenState createState() => _NewsCategoryScreenState();
}

class _NewsCategoryScreenState extends State<NewsCategoryScreen>
    with AutomaticKeepAliveClientMixin<NewsCategoryScreen> {
  int _newsId;
  ScrollController _scrollController;
  String dropdownValue;

  @override
  void initState() {
    super.initState();
    //  _onArgument();
    widget.id = widget.homeData.id;
    BlocProvider.of<NewsCategoryBloc>(context).add(LoadNewsCategory(widget.id,"",""));
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    openLoading();
    return BlocListener<NewsCategoryBloc, NewsCategoryState>(
      listener: (context, state) async {
        if (state.isLoading) {
          await HttpHandler.resolve(status: state.status);
        }

        if (state.isSuccess) {
          await HttpHandler.resolve(status: state.status);
        }

        if (state.isFailure) {
          await HttpHandler.resolve(status: state.status);
        }
      },
      child: BlocBuilder<NewsCategoryBloc, NewsCategoryState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[300],
            body: SafeArea(
                top: false,
                child: Column(
                  children: [
                    _buildAppbar("Tin tức", "Tìm kiếm tin tức"),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      height: 35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                              ),
                              child: _builDropBox('Tất cả'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'assets/images/ic_grid.png',
                            height: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          DropdownButton<String>(
                            value: dropdownValue = 'Sắp xếp theo',
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            underline: SizedBox(),
                            style: TextStyle(color: Colors.black),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>[dropdownValue]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: _buildContent(state),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }

  Widget _buildContent(NewsCategoryState state) {
    if (state.news != null) {
      return ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return WidgetNews(news: state.news[index]);
        },
//                  itemExtent: 100.0,
        itemCount: state.news.length,
        separatorBuilder: (context, index) {
          return WidgetSpacer(height: 5);
        },
        physics: BouncingScrollPhysics(),
      );
    } else {
      return Center(
        child: Container(
          height: 100,
          width: 100,
          child: Lottie.asset(
            'assets/lottie/trail_loading.json',
          ),
        ),
      );
    }
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildAppbar(String title, String titleSearch) =>
      WidgetAppbarWithSearch(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        title: title,
        titleSearch: titleSearch,
      );
  _builDropBox(String value) => DropBoxAppBar(
        value: value,
      );

  void openLoading() async {
    Future.delayed(Duration(seconds: 2), () {
      BlocProvider.of<NewsCategoryBloc>(context)
          .add(RefreshNewsCategory(widget.id,"",""));
    });
  }
}
