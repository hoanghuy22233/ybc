import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/model/repo/home_repository.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/category_courser/bloc/category_course_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/category_courser/bloc/category_course_state.dart';
import 'package:ybc/utils/dio/dio_error_util.dart';

class CategoryCourseBloc
    extends Bloc<CategoryCourseEvent, CategoryCourseState> {
  final HomeRepository homeRepository;

  CategoryCourseBloc({@required this.homeRepository});

  @override
  CategoryCourseState get initialState => CategoryCourseLoading();

  @override
  Stream<CategoryCourseState> mapEventToState(
      CategoryCourseEvent event) async* {
    if (event is LoadCategoryCourse) {
      yield* _mapLoadCategoryCourseToState();
    } else if (event is RefreshCategoryCourse) {
      yield CategoryCourseLoading();
      yield* _mapLoadCategoryCourseToState();
    }
  }

  Stream<CategoryCourseState> _mapLoadCategoryCourseToState() async* {
    try {
      final categoryCourseResponse = await homeRepository.getCourserCategory();
      await Future.delayed(Duration(milliseconds: 500), () {});
      yield CategoryCourseLoaded(categoriesResponse: categoryCourseResponse);
    } catch (e) {
      yield CategoryCourseNotLoaded(status: DioErrorUtil.handleError(e));
    }
  }
}
