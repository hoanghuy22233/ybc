import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/model/entity/banner.dart';
import 'package:ybc/model/repo/home_repository.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/home_banner/bloc/home_banner_state.dart';

import 'home_banner_event.dart';

class HomeBannerBloc extends Bloc<HomeBannerEvent, HomeBannerState> {
  final HomeRepository homeRepository;

  HomeBannerBloc({@required this.homeRepository});

  @override
  HomeBannerState get initialState => HomeBannerLoading();

  @override
  Stream<HomeBannerState> mapEventToState(HomeBannerEvent event) async* {
    if (event is LoadHomeBanner) {
      yield* _mapLoadHomeBannerToState();
    } else if (event is RefreshHomeBanner) {
      yield HomeBannerLoading();
      yield* _mapLoadHomeBannerToState();
    }
  }

  Stream<HomeBannerState> _mapLoadHomeBannerToState() async* {
    final currentState = state;
    try {
      if (state is HomeBannerLoading) {
        final product = await _fetchProduct();
        yield HomeBannerLoaded(banners: product, hasReachedMax: false);
      }
      if (currentState is HomeBannerLoaded) {
        final product = await _fetchProduct();
//      await Future.delayed(Duration(seconds: 5), () {});
        yield product.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : HomeBannerLoaded(
                banners: currentState.banners + product,
                hasReachedMax: false,
              );
      }
    } catch (e) {
      print(e);
      yield HomeBannerNotLoaded('$e');
    }
  }

  Future<List<Banners>> _fetchProduct(
      {@required int limit, @required int offset, @required int sort}) async {
    try {
      final response = await homeRepository.getBanner();
      return response.data.data;
    } catch (e) {
      throw Exception('$e');
    }
  }
}
