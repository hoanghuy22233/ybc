import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/model/entity/courses.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/bloc/courses_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/bloc/courses_state.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/search_courser/widget_list_courser.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/search_new/widget_search_appar.dart';
import 'package:ybc/utils/handler/http_handler.dart';

class SearchCourserScreen extends StatefulWidget {
  const SearchCourserScreen();

  @override
  _SearchCourserScreenState createState() => new _SearchCourserScreenState();
}

class _SearchCourserScreenState extends State<SearchCourserScreen>
    with SingleTickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      new GlobalKey<ScaffoldState>();

  TextEditingController _searchQuery;
  bool _isSearching = false;

  List<Courses> filteredRecored;
  List<Courses> allRecord;
  String msgStatus = '';
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _searchQuery = new TextEditingController();
    // BlocProvider.of<PostBloc>(context).add(LoadPost());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _isSearching = true);
      BlocProvider.of<CoursesBloc>(context).add(LoadCourses( null,
          '',
           ''));
    });
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
      filteredRecored.addAll(allRecord);
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQuery.clear();
      updateSearchQuery("Search query");
    });
  }

  Widget _buildTitle(BuildContext context) {
    var horizontalTitleAlignment =
        Platform.isIOS ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return new InkWell(
      onTap: () => scaffoldKey.currentState.openDrawer(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: horizontalTitleAlignment,
          children: <Widget>[
            new Text(
              'Seach box',
              style: new TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchFiel() {
    return new Stack(
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        Row(
          children: <Widget>[
            // SizedBox(
            //   width: 15.0,
            // ),
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                new Container(
                  height: 40.0,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: StreamBuilder(
                    stream: null,
                    builder: (context, snapshot) => TextField(
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                      controller: _searchQuery,
                      autofocus: true,
                      onTap: () {
                        showToast();
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 30.0),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Tìm kiếm khóa học",
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[300], width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          errorText: snapshot.hasError ? snapshot.error : null,
                          labelStyle: TextStyle(fontSize: 15.0)),
                      onChanged: updateSearchQuery,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ],
    );
  }

  void updateSearchQuery(String newQuery) {
    filteredRecored.clear();
    if (newQuery.length > 0) {
      Set<Courses> set = Set.from(allRecord);
      set.forEach((element) => filterList(element, newQuery));
    }

    if (newQuery.isEmpty) {
      filteredRecored.addAll(allRecord);
    }

    setState(() {});
  }

  filterList(Courses item, String searchQuery) {
    setState(() {
      if (item.name.toLowerCase().contains(searchQuery) ||
          item.name.contains(searchQuery)) {
        filteredRecored.add(item);
      }
    });
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        new GestureDetector(
            onTap: () {
              if (_searchQuery == null || _searchQuery.text.isEmpty) {
                AppNavigator.navigateBack();
                return;
              }
              _clearSearchQuery();
            },
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                "Hủy",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ))),
      ];
    }

    return <Widget>[
      new IconButton(
        icon: const Icon(
          Icons.search,
          color: Colors.red,
        ),
        onPressed: _startSearch,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        top: true,
        child: BlocListener<CoursesBloc, CoursesState>(
          listener: (context, state) async {
            if (state.isLoading) {
              await HttpHandler.resolve(status: state.status);
            }

            if (state.isSuccess) {
              await HttpHandler.resolve(status: state.status);
              allRecord = state.courses;
              filteredRecored = new List<Courses>();
              filteredRecored.addAll(allRecord);
            }

            if (state.isFailure) {
              await HttpHandler.resolve(status: state.status);
            }
          },
          child: BlocBuilder<CoursesBloc, CoursesState>(
            builder: (context, state) {
              // filteredRecored = state.post;
              return Column(
                children: [
                  _buildNavigationBar(),
                  Expanded(
                    child: Container(
                      child: Visibility(
                          visible: _isVisible,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: filteredRecored != null &&
                                      filteredRecored.length > 0
                                  ? Column(
                                      children: [
                                        Expanded(
                                          child: WidgetListCourses(
                                              courses: filteredRecored),
                                        )
                                      ],
                                    )
                                  : allRecord == null
                                      ? new Center(
                                          child: new CircularProgressIndicator())
                                      : new Center(
                                          child:
                                              new Text("Không tìm thấy khóa học!"),
                                        ),
                            ),
                          )),
                  ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void Finishs() {
    Navigator.of(context).pop();
  }

  void showToast() {
    setState(() {
      _isVisible = _isVisible;
    });
  }

  _buildNavigationBar() {
    return WidgetSearchAppbar(
      title: [_isSearching ? _buildSearchFiel() : _buildTitle(context)],
      backgroundColor: Colors.blue,
      height: 80,
      textColor: Colors.white,
      left: [
        Container(
            margin: const EdgeInsets.only(
              left: AppValue.ACTION_BAR_HEIGHT * 0.4,
            ),
            height: 25,
            width: 25,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey[100]),
            child: WidgetAppbarMenu(
              icon: Image.asset(
                'assets/icons/ic_back.png',
                color: Colors.black,
              ),
              onTap: () {
                AppNavigator.navigateBack();
              },
            ))
      ],
    );
  }
}
