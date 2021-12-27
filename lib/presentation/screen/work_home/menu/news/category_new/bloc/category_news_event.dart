import 'package:equatable/equatable.dart';

class NewsCategoryEvent extends Equatable {
  const NewsCategoryEvent();

  List<Object> get props => [];
}

class LoadNewsCategory extends NewsCategoryEvent {
  final String name;
  final String create;
  final int id;

  LoadNewsCategory(this.id, this.name, this.create);

  List<Object> get props => [id, name, create];

  @override
  String toString() {
    return 'LoadNewsCategory{id:$id,name: $name,create: $create}';
  }
}

class RefreshNewsCategory extends NewsCategoryEvent {
  final String name;
  final String create;
  final int id;

  RefreshNewsCategory(this.id, this.name, this.create);

  List<Object> get props => [id, name, create];

  @override
  String toString() {
    return 'RefreshNewsCategory{id:$id,name: $name,create: $create}';
  }
}

class RemoveNewsCategory extends NewsCategoryEvent {
  final int id;

  RemoveNewsCategory(this.id);

  List<Object> get props => [id];

  @override
  String toString() {
    return 'RemoveNewsCategory{id: $id}';
  }
}
