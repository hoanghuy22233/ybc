import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ybc/model/repo/home_repository.dart';
import 'package:ybc/utils/dio/dio_error_util.dart';

import 'courser_detail_event.dart';
import 'courser_detail_state.dart';

class CourserDetailBloc extends Bloc<CourserDetailEvent, CourserDetailState> {
  final HomeRepository homeRepository;

  CourserDetailBloc({@required this.homeRepository});

  @override
  CourserDetailState get initialState => CourserDetailLoading();

  @override
  Stream<CourserDetailState> mapEventToState(CourserDetailEvent event) async* {
    if (event is LoadCourserDetail) {
      yield* _mapLoadCourserDetailToState(event.courserId);
    } else if (event is RefreshCourserDetail) {
      yield CourserDetailLoading();
      yield* _mapLoadCourserDetailToState(event.courserId);
    }
  }

  Stream<CourserDetailState> _mapLoadCourserDetailToState(
      int courserId) async* {
    try {
      final response =
          await homeRepository.getCourserDetail(courserId: courserId);
      yield CourserDetailLoaded(courseDetail: response.data);
    } catch (e) {
      yield CourserDetailNotLoaded(DioErrorUtil.handleError(e));
    }
  }
}
