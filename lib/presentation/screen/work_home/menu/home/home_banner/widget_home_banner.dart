import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/home_banner/widget_categories_banner.dart';

import 'bloc/home_banner_bloc.dart';
import 'bloc/home_banner_event.dart';
import 'bloc/home_banner_state.dart';

class WidgetHomeCategoriesBanners extends StatefulWidget {
  @override
  _WidgetHomeCategoriesBannersState createState() =>
      _WidgetHomeCategoriesBannersState();
}

class _WidgetHomeCategoriesBannersState
    extends State<WidgetHomeCategoriesBanners> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBannerBloc>(context).add(LoadHomeBanner());
  }

  onRefresh(HomeBannerLoaded state) async {
    BlocProvider.of<HomeBannerBloc>(context).add(RefreshHomeBanner());
  }

  _onLoadMore(HomeBannerLoaded state) async {
    BlocProvider.of<HomeBannerBloc>(context).add(LoadHomeBanner());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBannerBloc, HomeBannerState>(
      listener: (context, state) {
        if (state is HomeBannerLoaded) {
          if (state.hasReachedMax) {
            _refreshController.loadNoData();
          } else {
            _refreshController.loadComplete();
          }
        }
      },
      child: BlocBuilder<HomeBannerBloc, HomeBannerState>(
        builder: (context, state) {
          return Container(
            child: _buildContent(state),
          );
        },
      ),
    );
  }

  Widget _buildContent(HomeBannerState state) {
    if (state is HomeBannerLoaded) {
      return Container(
          child: WidgetCategoriesBanner(
        actionMore: () {
          //  AppNavigator.navigateProductCollection(ProductCollectionType.NEW);
        },
        refreshController: _refreshController,
        products: state.banners,
        onLoadMore: () => _onLoadMore(state),
        onRefresh: () => onRefresh(state),
      ));
    } else if (state is HomeBannerLoading) {
      return Container(
        width: double.infinity,
        height: AppValue.PRODUCT_HORIZONTAL_HEIGHT,
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            child: Lottie.asset(
              'assets/lottie/trail_loading.json',
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: Text('Unknown state'),
      );
    }
  }
}
