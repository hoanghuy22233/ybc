import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ybc/model/repo/home_repository.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_detail/bloc/news_detail_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_detail/bloc/news_detail_state.dart';
import 'package:ybc/utils/dio/dio_error_util.dart';

class NewsDetailBloc extends Bloc<NewsDetailEvent, NewsDetailState> {
  final HomeRepository homeRepository;

  NewsDetailBloc({@required this.homeRepository});

  @override
  NewsDetailState get initialState => NewsDetailLoading();

  @override
  Stream<NewsDetailState> mapEventToState(NewsDetailEvent event) async* {
    if (event is LoadNewsDetail) {
      yield* _mapLoadNewsDetailToState(event.newsId);
    } else if (event is RefreshNewsDetail) {
      yield NewsDetailLoading();
      yield* _mapLoadNewsDetailToState(event.newsId);
    }
  }

  Stream<NewsDetailState> _mapLoadNewsDetailToState(int newsId) async* {
    try {
      final response = await homeRepository.getNewsDetail(newsId: newsId);
      yield NewsDetailLoaded(news: response.data);
    } catch (e) {
      yield NewsDetailNotLoaded(DioErrorUtil.handleError(e));
    }
  }
}
