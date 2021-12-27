import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ybc/model/entity/home_data.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/home_tailk/bloc/home_categories_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/home_tailk/bloc/home_categories_state.dart';

import 'list_work_main.dart';

class WidgetHomeCategories extends StatefulWidget {
  @override
  final Function(HomeData homeData, int) onCategoryClick;
  WidgetHomeCategories({this.onCategoryClick});
  _WidgetHomeCategoriesState createState() => _WidgetHomeCategoriesState();
}

class _WidgetHomeCategoriesState extends State<WidgetHomeCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<HomeCategoriesBloc, HomeCategoriesState>(
        builder: (context, state) {
          if (state is HomeCategoriesLoaded) {
            return _buildCategory(state);
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
    );
  }

  Widget _buildCategory(HomeCategoriesLoaded state) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return ChildWorkMain(
          homeData: state.category[index],
          onCategoryClick: this.widget.onCategoryClick,
        );
      },
      separatorBuilder: (context, index) {
        return WidgetSpacer(
          height: 10,
        );
      },
      // physics: BouncingScrollPhysics(),
      itemCount: state.category.length,
    );
  }
}
