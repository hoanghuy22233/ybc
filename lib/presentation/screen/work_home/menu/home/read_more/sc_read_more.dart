import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ybc/model/entity/home_data.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/read_more/widget_detail_see_more.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_account/widget_appbar_not_search.dart';

import 'bloc/bloc.dart';

class ReadMoreScreen extends StatefulWidget {
  HomeData homeData;

  ReadMoreScreen({this.homeData});
  @override
  _ReadMoreScreenState createState() => _ReadMoreScreenState();
}

class _ReadMoreScreenState extends State<ReadMoreScreen> {
  int _categoryId;
  String _title;

  // _onArgument() {
  //   Future.delayed(Duration.zero, () async {
  //     final Map arguments = ModalRoute.of(context).settings.arguments as Map;
  //     setState(() {
  //       _categoryId = arguments['categoryId'];
  //       print('---categoryId: $_categoryId   - --');
  //
  //       _title = arguments['title'];
  //       print('---title: $_title---');
  //
  //       BlocProvider.of<CategoryDetailBloc>(context)
  //           .add(LoadCategoryDetail(_categoryId));
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryDetailBloc>(context)
        .add(LoadCategoryDetail(widget.homeData.id));
    //_onArgument();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailBloc, CategoryDetailState>(
        builder: (context, state) {
      if (state is CategoryDetailLoaded) {
        return Scaffold(
          body: SafeArea(
            top: false,
            child: _buildContent(context, state),
          ),
        );
      } else if (state is CategoryDetailLoading) {
        return Center(
          child: Container(
            height: 100,
            width: 100,
            child: Lottie.asset(
              'assets/lottie/trail_loading.json',
            ),
          ),
        );
      } else if (state is CategoryDetailNotLoaded) {
        return Center(
          child: Text('${state.error}'),
        );
      } else {
        return Center(
          child: Text('Unknown state'),
        );
      }
    });
  }

  _buildContent(BuildContext context, CategoryDetailLoaded state) {
    return Container(
      child: Column(
        children: [
          _buildAppbar(_title),
          Expanded(child: _buildContents(state))
        ],
      ),
    );
  }

  Widget _buildContents(CategoryDetailLoaded state) {
    if (state.categoryDetail != null) {
      return ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return WidgetDetailSeeMore(news: state.categoryDetail.data[index]);
        },
//                  itemExtent: 100.0,
        itemCount: state.categoryDetail.data.length,
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

  Widget _buildAppbar(String title) => WidgetAppbarNotSearch(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        left: [
          WidgetAppbarMenuBack(),
        ],
        title: title,
      );
}
