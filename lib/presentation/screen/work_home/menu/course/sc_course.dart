import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ybc/model/entity/category_menu.dart';
import 'package:ybc/model/entity/home_data.dart';
import 'package:ybc/model/repo/home_repository.dart';
import 'package:ybc/presentation/common_widgets/widget_screen_error.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/DropBox_cource.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/widget_cart_appbar_menu.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/category_courser/bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/category_courser/widget_courser_categories.dart';
import 'package:ybc/utils/handler/http_handler.dart';

import 'courses/widget_courses.dart';
import 'courses/widget_courses_appbar.dart';

class WorkCourseScreen extends StatefulWidget {
  MenuCategories category;
  int type;

  WorkCourseScreen({this.category, this.type});
  @override
  _WorkCourseScreenState createState() => _WorkCourseScreenState();
}

class _WorkCourseScreenState extends State<WorkCourseScreen>
    with AutomaticKeepAliveClientMixin<WorkCourseScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  String dropdownValue;
  List<Item> _item = Item.getItem();
  List<DropdownMenuItem<Item>> _dropdownMenuItems;
  Item _selected;
  HomeData dropdownValues;
  List<HomeData> homeDatas;
  int type;

  @override
  void initState() {
    super.initState();
    //   BlocProvider.of<CategoryCourseBloc>(context).add(LoadCategoryCourse());
    BlocProvider.of<CoursesBloc>(context).add(
        LoadCourses(type ?? null, _selected?.key ?? '', _selected?.key ?? ''));
  }

  //
  onRefresh(CategoryCourseLoaded state) async {
    BlocProvider.of<CategoryCourseBloc>(context).add(RefreshCategoryCourse());
  }

  _onLoadMore(CategoryCourseLoaded state) async {
    BlocProvider.of<CategoryCourseBloc>(context).add(LoadCategoryCourse());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    openLoading();
    var homeRepository = RepositoryProvider.of<HomeRepository>(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CategoryCourseBloc(homeRepository: homeRepository),
          ),
        ],
        child: BlocListener<CoursesBloc, CoursesState>(
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
          child: BlocBuilder<CoursesBloc, CoursesState>(
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Colors.grey[300],
                body: SafeArea(
                    top: true,
                    child: Column(
                      children: [
                        _buildAppbar("Khóa học", "Tìm kiếm khóa học"),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 6,
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white,
                                    ),
                                    child: WidgetCourserCategories(
                                      type: type,
                                    ),
                                  )),
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
                                    BlocProvider.of<CoursesBloc>(context).add(
                                        LoadCourses(
                                            type ?? null,
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
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: _buildContent(state),
                        )
                      ],
                    )),
              );
            },
          ),
        ));
  }

  Widget _buildContent(CoursesState state) {
    if (state.courses != null) {
      return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.78,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        scrollDirection: Axis.vertical,
        itemCount: state.courses.length,
        itemBuilder: (context, index) {
          return Container(
            child: WidgetCourser(
              courses: state.courses[index],
            ),
          );
        },
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

  // Widget _buildCategory(CategoryCourseState state) {
  //   if (state is CategoryCourseLoaded) {
  //     return Container(
  //       padding: EdgeInsets.symmetric(horizontal: 15),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(25),
  //         color: Colors.white,
  //       ),
  //       child: _builDropBox(state),
  //     );
  //   } else if (state is CategoryCourseLoading) {
  //     return Container(
  //       width: double.infinity,
  //       height: AppValue.PRODUCT_HORIZONTAL_HEIGHT,
  //       child: Center(
  //         child: Container(
  //           height: 100,
  //           width: 100,
  //           child: Lottie.asset(
  //             'assets/lottie/trail_loading.json',
  //           ),
  //         ),
  //       ),
  //     );
  //   } else if (state is CategoryCourseNotLoaded) {
  //     return Center(
  //       child: Text('${state.status}'),
  //     );
  //   } else {
  //     return Center(
  //       child: Text('Unknown state'),
  //     );
  //   }
  // }

  _buildCategorys(CategoryCourseState state) {
    if (state is CategoryCourseLoaded) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: _builDropBox(state),
      );
    } else if (state is CategoryCourseLoading) {
      return Center(
        child: Container(
          height: 100,
          width: 100,
          child: Lottie.asset(
            'assets/lottie/trail_loading.json',
          ),
        ),
      );
    } else if (state is CategoryCourseNotLoaded) {
      return WidgetScreenError(
        status: state.status,
      );
    } else {
      return Center(
        child: Text('Unknown state'),
      );
    }
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildAppbar(String title, String titleSearch) =>
      WidgetAppbarWithSearchCourser(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        title: title,
        titleSearch: titleSearch,
        right: [
          WidgetCartAppBarMenu()
        ],
      );

  // _builDropBox(String value) => DropBox(
  //       value: value,
  //     );
  _builDropBox(CategoryCourseLoaded state) =>
      DropBox(courser: state.categoriesResponse.data, type: widget.type);

  void openLoading() async {
    Future.delayed(Duration(seconds: 2), () {
      BlocProvider.of<CoursesBloc>(context).add(RefreshCourses(
          type ?? null, _selected?.key ?? '', _selected?.key ?? ''));
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
      Item(0, 'Lọc theo giá', 'final_price|asc'),
      Item(1, 'Lọc theo ngày', "created_at|desc"),
    ];
  }
}
