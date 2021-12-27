import 'package:meta/meta.dart';
import 'package:ybc/model/entity/courses.dart';
import 'package:ybc/model/entity/news.dart';
import 'package:ybc/utils/dio/dio_status.dart';

class CoursesState {
  final List<Courses> courses;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  CoursesState(
      {@required this.courses,
        @required this.isLoading,
        @required this.isSuccess,
        @required this.isFailure,
        @required this.status});

  factory CoursesState.empty() {
    return CoursesState(
        courses: null,
        isLoading: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory CoursesState.loading(CoursesState state) {
    return CoursesState(
        courses: state.courses,
        isLoading: true,
        isSuccess: false,
        isFailure: false,
        status: state.status);
  }

  factory CoursesState.failure(CoursesState state) {
    return CoursesState(
        courses: state.courses,
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        status: state.status);
  }

  factory CoursesState.success(CoursesState state) {
    return CoursesState(
        courses: state.courses,
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        status: state.status);
  }

  CoursesState update(
      {List<Courses> courses,
        bool isLoading,
        bool isSuccess,
        bool isFailure,
        DioStatus status}) {
    return copyWith(
      courses: courses,
      isLoading: false,
      isSuccess: false,
      isFailure: false,
      status: status,
    );
  }

  CoursesState copyWith({
    List<Courses> courses,
    bool isLoading,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return CoursesState(
      courses: courses?? this.courses,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'CoursesState{courses: $courses, isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
