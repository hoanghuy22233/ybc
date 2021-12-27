import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/model/entity/banner.dart';
import 'package:ybc/presentation/common_widgets/widget_banner_image.dart';
import 'package:ybc/presentation/common_widgets/widget_banner_wrapper.dart';

class WidgetCategoriesBanner extends StatefulWidget {
  final String categoryName;
  final List<Banners> products;
  final RefreshController refreshController;
  final Function onLoadMore;
  final Function onRefresh;
  final Function actionMore;
  final Color color;
  final String tag;

  WidgetCategoriesBanner({
    Key key,
    this.categoryName,
    this.products,
    this.onLoadMore,
    this.onRefresh,
    this.tag,
    this.color,
    this.actionMore,
    this.refreshController,
  }) : super(key: key);

  @override
  _WidgetCategoriesBannerState createState() => _WidgetCategoriesBannerState();
}

class _WidgetCategoriesBannerState extends State<WidgetCategoriesBanner> {
  @override
  Widget build(BuildContext context) {
    return WidgetBannerWrapper(
      child: Swiper(
        autoplay: true,
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return WidgetBannerImage(
            banner: widget.products[index],
          );
        },
        pagination: new SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              size: 5,
              activeSize: 10,
              color: AppColor.BANNER_COLOR,
              activeColor: AppColor.BANNER_SELECTED_COLOR),
        ),
      ),
    );
  }
}
