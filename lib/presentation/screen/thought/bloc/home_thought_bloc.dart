import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/model/entity/thought.dart';
import 'package:ybc/model/repo/home_repository.dart';

import 'home_thought_event.dart';
import 'home_thought_state.dart';

class HomeThoughBloc extends Bloc<HomeThoughEvent, HomeThoughState> {
  final HomeRepository homeRepository;

  HomeThoughBloc({@required this.homeRepository});

  @override
  HomeThoughState get initialState => HomeThoughLoading();

  @override
  Stream<HomeThoughState> mapEventToState(HomeThoughEvent event) async* {
    if (event is LoadHomeThough) {
      yield* _mapLoadHomeThoughToState();
    } else if (event is RefreshHomeThough) {
      yield HomeThoughLoading();
      yield* _mapLoadHomeThoughToState();
    }
  }

  Stream<HomeThoughState> _mapLoadHomeThoughToState() async* {
    final currentState = state;
    try {
      if (state is HomeThoughLoading) {
        final product = await _fetchProduct();
        yield HomeThoughLoaded(thought: product, hasReachedMax: false);
      }
      if (currentState is HomeThoughLoaded) {
        final product = await _fetchProduct();
//      await Future.delayed(Duration(seconds: 5), () {});
        yield product.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : HomeThoughLoaded(
                thought: currentState.thought + product,
                hasReachedMax: false,
              );
      }
    } catch (e) {
      print(e);
      yield HomeThoughNotLoaded('$e');
    }
  }

  Future<List<Thought>> _fetchProduct() async {
    try {
      final response = await homeRepository.getThought();
      return response.data;
    } catch (e) {
      throw Exception('$e');
    }
  }
}
