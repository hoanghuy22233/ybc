import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/DropBox_cource.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/category_courser/bloc/category_course_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/category_courser/bloc/category_course_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/category_courser/bloc/category_course_state.dart';

class WidgetCourserCategories extends StatefulWidget {
  @override
  int type;
  WidgetCourserCategories({this.type});
  _WidgetCourserCategoriesState createState() =>
      _WidgetCourserCategoriesState();
}

class _WidgetCourserCategoriesState extends State<WidgetCourserCategories> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryCourseBloc>(context).add(LoadCategoryCourse());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<CategoryCourseBloc, CategoryCourseState>(
        builder: (context, state) {
          if (state is CategoryCourseLoaded) {
            return _buildCategory(state);
          } else {
            return Center(
                child: Container(
              height: 20,
              width: 20,
              child: Lottie.asset(
                'assets/lottie/trail_loading.json',
              ),
            ));
          }
        },
      ),
    );
  }

  Widget _buildCategory(CategoryCourseLoaded state) {
    return DropBox(courser: state.categoriesResponse.data, type: widget.type);
  }
}
