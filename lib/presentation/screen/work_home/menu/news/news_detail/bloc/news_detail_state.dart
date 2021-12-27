import 'package:equatable/equatable.dart';
import 'package:ybc/model/entity/news_detail_data.dart';
import 'package:ybc/utils/dio/dio_status.dart';

abstract class NewsDetailState extends Equatable {
  const NewsDetailState();

  @override
  List<Object> get props => [];
}

class NewsDetailLoading extends NewsDetailState {}

class NewsDetailLoaded extends NewsDetailState {
  final NewsDetailData news;
  const NewsDetailLoaded({this.news});

  @override
  List<Object> get props => [news];

  @override
  String toString() {
    return 'NewsDetailLoaded{news: $news}';
  }
}

class NewsDetailNotLoaded extends NewsDetailState {
  final DioStatus status;

  NewsDetailNotLoaded(this.status);

  @override
  String toString() {
    return 'NewsDetailNotLoaded{error: $status}';
  }
}
