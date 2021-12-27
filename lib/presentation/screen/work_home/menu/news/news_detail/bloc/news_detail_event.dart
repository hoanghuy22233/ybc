import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NewsDetailEvent extends Equatable {
  const NewsDetailEvent();

  List<Object> get props => [];
}

class LoadNewsDetail extends NewsDetailEvent {
  final int newsId;

  LoadNewsDetail(this.newsId);

  @override
  String toString() {
    return 'LoadNewsDetail{newsId: $newsId}';
  }

  List<Object> get props => [newsId];
}

class RefreshNewsDetail extends NewsDetailEvent {
  final int newsId;

  RefreshNewsDetail(this.newsId);

  @override
  String toString() {
    return 'RefreshNewsDetail{newsId: $newsId}';
  }

  List<Object> get props => [newsId];
}