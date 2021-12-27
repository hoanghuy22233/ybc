import 'package:equatable/equatable.dart';

class CourserDetailEvent extends Equatable {
  const CourserDetailEvent();

  List<Object> get props => [];
}

class LoadCourserDetail extends CourserDetailEvent {
  final int courserId;

  LoadCourserDetail(this.courserId);

  @override
  String toString() {
    return 'LoadCourserDetail{courserId: $courserId}';
  }

  List<Object> get props => [courserId];
}

class RefreshCourserDetail extends CourserDetailEvent {
  final int courserId;

  RefreshCourserDetail(this.courserId);

  @override
  String toString() {
    return 'RefreshCourserDetail{courserId: $courserId}';
  }

  List<Object> get props => [courserId];
}
