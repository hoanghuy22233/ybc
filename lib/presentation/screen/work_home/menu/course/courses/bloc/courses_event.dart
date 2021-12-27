import 'package:equatable/equatable.dart';

class CoursesEvent extends Equatable {
  const CoursesEvent();

  List<Object> get props => [];
}

class LoadCourses extends CoursesEvent {
  final String name;
  final String create;
  final int id;

  LoadCourses(this.id, this.name, this.create);

  List<Object> get props => [id, name, create];

  @override
  String toString() {
    return 'LoadCourses{id:$id,name: $name,create: $create}';
  }
}

class RefreshCourses extends CoursesEvent {
  final String name;
  final String create;
  final int id;

  RefreshCourses(this.id, this.name, this.create);

  List<Object> get props => [id, name, create];

  @override
  String toString() {
    return 'RefreshCourses{id:$id,name: $name,create: $create}';
  }
}

class RemoveCourses extends CoursesEvent {
  final int id;

  RemoveCourses(this.id);

  List<Object> get props => [id];

  @override
  String toString() {
    return 'RemoveCourses{id: $id}';
  }
}
