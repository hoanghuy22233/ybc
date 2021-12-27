import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ybc/model/repo/home_repository.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_new/bloc/news_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_new/bloc/news_state.dart';
import 'package:ybc/utils/dio/dio_error_util.dart';
import 'package:ybc/utils/dio/dio_status.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final HomeRepository homeRepository;

  NewsBloc({@required this.homeRepository});

  @override
  NewsState get initialState => NewsState.empty();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is LoadNews) {
      yield* _mapLoadNewsToState(
          event?.id ?? null, event?.name ?? '', event?.create ?? '');
    } else if (event is RefreshNews) {
      yield NewsState.loading(state.copyWith(
          status: DioStatus(
        code: DioStatus.API_PROGRESS,
      )));
      yield* _mapLoadNewsToState(
          event?.id ?? null, event?.name ?? '', event?.create ?? '');
    }
  }

  Stream<NewsState> _mapLoadNewsToState(
      int id, String name, String create) async* {
    try {
      final response = await homeRepository.getNews(
          categoryId: id ?? null, name: name ?? '', create: create ?? '');
      yield NewsState.success(state.update(
          news: response.data.data,
          status:
              DioStatus(code: DioStatus.API_SUCCESS, message: response.msg)));
    } catch (e) {
      yield NewsState.failure(
          state.update(status: DioErrorUtil.handleError(e)));
    }
  }

  // Stream<ImagesState> _mapRemoveImagesToState(int id) async* {
  //   try {
  //     final response = await userRepository.removePost(id: id);
  //     yield ImagesState.success(state.update(
  //         post: response.data,
  //         status: DioStatus(
  //             code: DioStatus.API_SUCCESS, message: response.message)));
  //   } catch (e) {
  //     yield ImagesState.failure(
  //         state.update(status: DioErrorUtil.handleError(e)));
  //   }
  // }
}
