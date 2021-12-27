import 'package:equatable/equatable.dart';
import 'package:ybc/model/api/response/courses_courser_response.dart';
import 'package:ybc/utils/dio/dio_status.dart';

abstract class CategoryCourseState extends Equatable {
  const CategoryCourseState();

  @override
  List<Object> get props => [];
}

class CategoryCourseLoading extends CategoryCourseState {}

class CategoryCourseLoaded extends CategoryCourseState {
  final CoursesCategoriesResponse categoriesResponse;

  const CategoryCourseLoaded({this.categoriesResponse});

  @override
  List<Object> get props => [categoriesResponse];

  @override
  String toString() {
    return 'CategoryCourseLoaded{CategoryCourseResponse: $categoriesResponse}';
  }
}

class CategoryCourseNotLoaded extends CategoryCourseState {
  final DioStatus status;

  CategoryCourseNotLoaded({this.status});

  @override
  String toString() {
    return 'CategoryCourseNotLoaded{error: $status}';
  }
}
