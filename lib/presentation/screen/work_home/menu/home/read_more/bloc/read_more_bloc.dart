import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ybc/model/repo/barrel_repo.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/utils/dio/dio_error_util.dart';

import 'bloc.dart';

class CategoryDetailBloc extends Bloc<CategoryDetailEvent, CategoryDetailState> {
  final HomeRepository _homeRepository;

  CategoryDetailBloc({@required HomeRepository homeRepository})
      : assert(homeRepository != null),
        _homeRepository = homeRepository;

  @override
  CategoryDetailState get initialState => CategoryDetailLoading();

  @override
  Stream<CategoryDetailState> mapEventToState(CategoryDetailEvent event) async* {
    if (event is LoadCategoryDetail) {
      yield* _mapLoadCategoryDetailToState(event.categoryId);
    } else if (event is RefreshCategoryDetail) {
      yield CategoryDetailLoading();
      yield* _mapLoadCategoryDetailToState(event.categoryId);
    }
  }

  Stream<CategoryDetailState> _mapLoadCategoryDetailToState(int categoryId) async* {
    try {
      final CategoryResponse = await _homeRepository.getCategory(categoryId: categoryId);
      print('-----------------');
      yield CategoryDetailLoaded(CategoryResponse.data);
    } catch (e) {
      yield CategoryDetailNotLoaded(DioErrorUtil.handleError(e));
//      yield CategoryDetailNotLoaded(e);
    }
  }
}
