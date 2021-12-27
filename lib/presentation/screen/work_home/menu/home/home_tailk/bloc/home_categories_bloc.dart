import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/bloc/home_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/bloc/home_state.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/home_tailk/bloc/home_categories_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/home_tailk/bloc/home_categories_state.dart';

class HomeCategoriesBloc
    extends Bloc<HomeCategoriesEvent, HomeCategoriesState> {
  final HomeBloc homeBloc;
  StreamSubscription subscription;

  HomeCategoriesBloc({@required this.homeBloc}) {
    subscription = homeBloc.listen((state) {
      if (state is HomeLoaded) {
        add(DisplayHomeCategories(
            category: state.homeResponse.data.categories));
      }
    });
  }

  @override
  HomeCategoriesState get initialState => HomeCategoriesNotLoaded();

  @override
  Stream<HomeCategoriesState> mapEventToState(
      HomeCategoriesEvent event) async* {
    if (event is DisplayHomeCategories) {
      yield* _mapDisplayHomeCategoriesToState(event.category);
    }
  }

  Stream<HomeCategoriesState> _mapDisplayHomeCategoriesToState(
      List<HomeData> category) async* {
    yield HomeCategoriesLoaded(category: category);
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
