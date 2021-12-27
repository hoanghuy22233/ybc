import 'package:meta/meta.dart';
import 'package:ybc/model/entity/news.dart';
import 'package:ybc/utils/dio/dio_status.dart';

class NewsState {
  final List<News> news;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  NewsState(
      {@required this.news,
      @required this.isLoading,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.status});

  factory NewsState.empty() {
    return NewsState(
        news: null,
        isLoading: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory NewsState.loading(NewsState state) {
    return NewsState(
        news: state.news,
        isLoading: true,
        isSuccess: false,
        isFailure: false,
        status: state.status);
  }

  factory NewsState.failure(NewsState state) {
    return NewsState(
        news: state.news,
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        status: state.status);
  }

  factory NewsState.success(NewsState state) {
    return NewsState(
        news: state.news,
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        status: state.status);
  }

  NewsState update(
      {List<News> news,
      bool isLoading,
      bool isSuccess,
      bool isFailure,
      DioStatus status}) {
    return copyWith(
      news: news,
      isLoading: false,
      isSuccess: false,
      isFailure: false,
      status: status,
    );
  }

  NewsState copyWith({
    List<News> news,
    bool isLoading,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return NewsState(
      news: news?? this.news,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'newsState{news: $news, isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
