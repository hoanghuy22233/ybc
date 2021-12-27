import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ybc/model/repo/home_repository.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/category_new/bloc/category_news_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/category_new/bloc/category_news_state.dart';
import 'package:ybc/utils/dio/dio_error_util.dart';
import 'package:ybc/utils/dio/dio_status.dart';

class NewsCategoryBloc extends Bloc<NewsCategoryEvent, NewsCategoryState> {
  final HomeRepository homeRepository;

  NewsCategoryBloc({@required this.homeRepository});

  @override
  NewsCategoryState get initialState => NewsCategoryState.empty();

  @override
  Stream<NewsCategoryState> mapEventToState(NewsCategoryEvent event) async* {
    if (event is LoadNewsCategory) {
      yield* _mapLoadNewsCategoryToState(
          event?.id ?? null, event?.name ?? 'name|asc', event?.create ?? '');
    } else if (event is RefreshNewsCategory) {
      yield NewsCategoryState.loading(state.copyWith(
          status: DioStatus(
        code: DioStatus.API_PROGRESS,
      )));
      yield* _mapLoadNewsCategoryToState(
          event?.id ?? null, event?.name ?? 'name|asc', event?.create ?? '');
    }
  }

  Stream<NewsCategoryState> _mapLoadNewsCategoryToState(
      int categoryId, String name, String create) async* {
    try {
      final response =
          await homeRepository.getNewsCategory(categoryId: categoryId);
      yield NewsCategoryState.success(state.update(
          news: response.data.data,
          status:
              DioStatus(code: DioStatus.API_SUCCESS, message: response.msg)));
    } catch (e) {
      yield NewsCategoryState.failure(
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
