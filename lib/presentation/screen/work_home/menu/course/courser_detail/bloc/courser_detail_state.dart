import 'package:equatable/equatable.dart';
import 'package:ybc/model/entity/courses_detail.dart';
import 'package:ybc/utils/dio/dio_status.dart';

abstract class CourserDetailState extends Equatable {
  const CourserDetailState();

  @override
  List<Object> get props => [];
}

class CourserDetailLoading extends CourserDetailState {}

class CourserDetailLoaded extends CourserDetailState {
  final CourseDetail courseDetail;
  const CourserDetailLoaded({this.courseDetail});

  @override
  List<Object> get props => [courseDetail];

  @override
  String toString() {
    return 'CourserDetailLoaded{courseDetail: $courseDetail}';
  }
}

class CourserDetailNotLoaded extends CourserDetailState {
  final DioStatus status;

  CourserDetailNotLoaded(this.status);

  @override
  String toString() {
    return 'CourserDetailNotLoaded{error: $status}';
  }
}
