import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/model/repo/home_repository.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/bloc/home_event.dart';
import 'package:ybc/utils/dio/dio_error_util.dart';

import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({@required this.homeRepository});

  @override
  HomeState get initialState => HomeLoading();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadHome) {
      yield* _mapLoadHomeToState();
    } else if (event is RefreshHome) {
      yield HomeLoading();
      yield* _mapLoadHomeToState();
    }
  }

  Stream<HomeState> _mapLoadHomeToState() async* {
    try {
      final homeResponse = await homeRepository.getHomeData();
      ;
      await Future.delayed(Duration(milliseconds: 500), () {});
      yield HomeLoaded(homeResponse: homeResponse);
    } catch (e) {
      yield HomeNotLoaded(status: DioErrorUtil.handleError(e));
    }
  }
}
