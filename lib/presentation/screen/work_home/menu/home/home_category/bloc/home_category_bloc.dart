import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/model/entity/category_menu.dart';
import 'package:ybc/model/repo/home_repository.dart';

import 'home_category_event.dart';
import 'home_category_state.dart';

class HomeCategoryBloc extends Bloc<HomeCategoryEvent, HomeCategoryState> {
  final HomeRepository homeRepository;

  HomeCategoryBloc({@required this.homeRepository});

  @override
  HomeCategoryState get initialState => HomeCategoryLoading();

  @override
  Stream<HomeCategoryState> mapEventToState(HomeCategoryEvent event) async* {
    if (event is LoadHomeCategory) {
      yield* _mapLoadHomeCategoryToState();
    } else if (event is RefreshHomeCategory) {
      yield HomeCategoryLoading();
      yield* _mapLoadHomeCategoryToState();
    }
  }

  Stream<HomeCategoryState> _mapLoadHomeCategoryToState() async* {
    final currentState = state;
    try {
      if (state is HomeCategoryLoading) {
        final product = await _fetchProduct();
        yield HomeCategoryLoaded(menu: product, hasReachedMax: false);
      }
      if (currentState is HomeCategoryLoaded) {
        final product = await _fetchProduct();
//      await Future.delayed(Duration(seconds: 5), () {});
        yield product.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : HomeCategoryLoaded(
                menu: currentState.menu + product,
                hasReachedMax: false,
              );
      }
    } catch (e) {
      print(e);
      yield HomeCategoryNotLoaded('$e');
    }
  }

  Future<List<MenuCategories>> _fetchProduct() async {
    try {
      final response = await homeRepository.getMenu();
      return response.data;
    } catch (e) {
      throw Exception('$e');
    }
  }
}
