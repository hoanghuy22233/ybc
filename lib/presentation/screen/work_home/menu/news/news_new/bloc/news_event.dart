import 'package:equatable/equatable.dart';

class NewsEvent extends Equatable {
  const NewsEvent();

  List<Object> get props => [];
}

class LoadNews extends NewsEvent {
  final String name;
  final String create;
  final int id;

  LoadNews(this.id, this.name, this.create);

  List<Object> get props => [id, name, create];

  @override
  String toString() {
    return 'LoadNews{id:$id,name: $name,create: $create}';
  }
}

class RefreshNews extends NewsEvent {
  final String name;
  final String create;
  final int id;

  RefreshNews(this.id, this.name, this.create);

  List<Object> get props => [id, name, create];

  @override
  String toString() {
    return 'RefreshNews{id:$id,name: $name,create: $create}';
  }
}

class RemoveNews extends NewsEvent {
  final int id;

  RemoveNews(this.id);

  List<Object> get props => [id];

  @override
  String toString() {
    return 'RemoveNews{id: $id}';
  }
}
