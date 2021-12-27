import 'package:meta/meta.dart';
import 'package:ybc/model/entity/news.dart';
import 'package:ybc/utils/dio/dio_status.dart';

class NewsCategoryState {
  final List<News> news;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  NewsCategoryState(
      {@required this.news,
      @required this.isLoading,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.status});

  factory NewsCategoryState.empty() {
    return NewsCategoryState(
        news: null,
        isLoading: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory NewsCategoryState.loading(NewsCategoryState state) {
    return NewsCategoryState(
        news: state.news,
        isLoading: true,
        isSuccess: false,
        isFailure: false,
        status: state.status);
  }

  factory NewsCategoryState.failure(NewsCategoryState state) {
    return NewsCategoryState(
        news: state.news,
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        status: state.status);
  }

  factory NewsCategoryState.success(NewsCategoryState state) {
    return NewsCategoryState(
        news: state.news,
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        status: state.status);
  }

  NewsCategoryState update(
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

  NewsCategoryState copyWith({
    List<News> news,
    bool isLoading,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return NewsCategoryState(
      news: news ?? this.news,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'NewsCategoryState{news: $news, isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}
