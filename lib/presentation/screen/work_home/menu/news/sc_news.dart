import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:ybc/model/entity/category_menu.dart';
import 'package:ybc/model/repo/home_repository.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/DropBox.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_appbar_with_search.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/bloc/home_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/bloc/home_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/home_category/bloc/home_category_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/home_tailk/bloc/home_categories_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/home_tailk/bloc/home_categories_state.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_new/bloc/news_event.dart';
import 'package:ybc/utils/handler/http_handler.dart';

import 'news_new/bloc/news_bloc.dart';
import 'news_new/bloc/news_state.dart';
import 'news_new/widget_news.dart';

// class MyNews extends StatelessWidget {
//   MenuCategories category;
//
//   MyNews({this.category});
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: Brightness.light,
//         primaryColor: AppColor.PRIMARY_COLOR,
//         accentColor: AppColor.PRIMARY_COLOR,
//         hoverColor: AppColor.PRIMARY_COLOR,
//         fontFamily: 'Montserrat',
//       ),
//       navigatorObservers: [],
//       home: WorkNewsScreen(
//         category: category,
//       ),
//     );
//   }
// }

class WorkNewsScreen extends StatefulWidget {
  MenuCategories category;
  HomeData homeData;
  int type;

  WorkNewsScreen({this.category, this.homeData, this.type});
  @override
  _WorkNewsScreenState createState() => _WorkNewsScreenState();
}

class _WorkNewsScreenState extends State<WorkNewsScreen>
    with AutomaticKeepAliveClientMixin<WorkNewsScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  String dropdownValue;
  String name, create;

  List<Item> _item = Item.getItem();
  List<DropdownMenuItem<Item>> _dropdownMenuItems;
  Item _selected;
  HomeData dropdownValues;
  List<HomeData> homeDatas;
  int type;

  @override
  void initState() {
    super.initState();
    widget.type = widget?.homeData?.id ?? null;
    BlocProvider.of<NewsBloc>(context).add(LoadNews(
        widget?.type ?? null, _selected?.key ?? '', _selected?.key ?? ''));

    BlocProvider.of<HomeBloc>(context).add(LoadHome());
    print("đây là");
    print(widget?.type ?? null);

    // _selected = _dropdownMenuItems[0].value;
    // print(_selected.key);
  }
  //
  // _onRefresh() async {
  //   BlocProvider.of<NewsNewBloc>(context).add(RefreshNewsNew());
  // }
  //
  // _onLoadMore() async {
  //   BlocProvider.of<NewsNewBloc>(context).add(LoadNewsNew());
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    openLoading();
    var homeRepository = RepositoryProvider.of<HomeRepository>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCategoryBloc(homeRepository: homeRepository),
        ),
        BlocProvider(
          create: (context) =>
              HomeCategoriesBloc(homeBloc: BlocProvider.of<HomeBloc>(context)),
        ),
      ],
      child: BlocListener<NewsBloc, NewsState>(
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
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.grey[300],
              body: SafeArea(
                  top: true,
                  child: Column(
                    children: [
                      _buildAppbar("Tin tức", "Tìm kiếm tin tức"),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 6,
                              child: BlocBuilder<HomeCategoriesBloc,
                                  HomeCategoriesState>(
                                builder: (context, state) {
                                  if (state is HomeCategoriesLoaded) {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: _builDropBoxs(state),
                                    );
                                  } else {
                                    return Center(
                                        child: Container(
                                      height: 100,
                                      width: 100,
                                      child: Lottie.asset(
                                        'assets/lottie/trail_loading.json',
                                      ),
                                    ));
                                  }
                                },
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
                            DropdownButton<Item>(
                              hint: Text("Sắp xếp theo"),
                              value: _selected,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              underline: SizedBox(),
                              style: TextStyle(color: Colors.black),
                              onChanged: (Item value) {
                                setState(() {
                                  _selected = value;
                                  BlocProvider.of<NewsBloc>(context).add(
                                      LoadNews(
                                          widget?.type ?? null,
                                          _selected?.key ?? '',
                                          _selected?.key ?? ''));
                                  print("____________");
                                  print(_selected.key);
                                });
                              },
                              items: _item.map((Item user) {
                                return DropdownMenuItem<Item>(
                                  value: user,
                                  child: Text(
                                    user.name,
                                    style: TextStyle(color: Colors.black),
                                  ),
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
      ),
    );
  }

  Widget _buildContent(NewsState state) {
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
  _builDropBox(HomeCategoriesLoaded state) =>
      DropBoxAppBar(homeData: state.category, type: widget.type);
  // _builDropBoxs(HomeCategoriesLoaded state) => DropdownButton<HomeData>(
  //       value: dropdownValues,
  //       hint: Text("Tất cả"),
  //       icon: Icon(Icons.arrow_drop_down),
  //       iconSize: 24,
  //       elevation: 16,
  //       isExpanded: true,
  //       underline: SizedBox(),
  //       style: TextStyle(color: Colors.black),
  //       onChanged: (HomeData newValue) {
  //         setState(() {
  //           homeDatas = state.category;
  //           dropdownValues = newValue;
  //           type = newValue.id;
  //           BlocProvider.of<NewsBloc>(context).add(LoadNews(type, '', ''));
  //           BlocProvider.of<NewsBloc>(context).add(RefreshNews(type, '', ''));
  //         });
  //       },
  //       items: homeDatas.map((HomeData item) {
  //         return DropdownMenuItem<HomeData>(
  //           value: item,
  //           child: Text(
  //             item.name ?? '',
  //             style: TextStyle(color: Colors.black),
  //           ),
  //         );
  //       }).toList(),
  //     );

  Widget _builDropBoxs(HomeCategoriesLoaded state) {
    homeDatas = state.category;
    return DropdownButton<HomeData>(
      value: dropdownValues,
      hint: Text("Tất cả"),
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      underline: SizedBox(),
      style: TextStyle(color: Colors.black),
      onChanged: (HomeData newValue) {
        setState(() {
          // type = newValue.id;
          widget.type = newValue.id;
          dropdownValues = newValue;
          BlocProvider.of<NewsBloc>(context)
              .add(LoadNews(widget?.type ?? null, '', ''));
          BlocProvider.of<NewsBloc>(context)
              .add(RefreshNews(widget?.type ?? null, '', ''));
        });
      },
      items: homeDatas.map((HomeData item) {
        return DropdownMenuItem<HomeData>(
          value: item,
          child: Text(
            item.name ?? '',
            style: TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
    );
  }

  void openLoading() async {
    Future.delayed(Duration(seconds: 2), () {
      BlocProvider.of<NewsBloc>(context).add(RefreshNews(
          widget?.type ?? null, _selected?.key ?? '', _selected?.key ?? ''));
    });
  }
}

class Item {
  const Item(this.id, this.name, this.key);
  final int id;
  final String name;
  final String key;

  static List<Item> getItem() {
    return <Item>[
      Item(0, 'Lọc theo tên', 'name|asc'),
      Item(1, 'Lọc theo ngày', "created_at|desc"),
    ];
  }
}
