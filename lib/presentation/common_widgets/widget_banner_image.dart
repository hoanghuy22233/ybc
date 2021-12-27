import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ybc/model/entity/banner.dart' as BannerImage;
import 'package:ybc/presentation/common_widgets/widget_cached_image_error.dart';
import 'package:ybc/presentation/common_widgets/widget_circle_progress.dart';

import '../../app/constants/value/value.dart';

class WidgetBannerImage extends StatelessWidget {
  final BannerImage.Banners banner;

  WidgetBannerImage({Key key, @required this.banner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _build(context),
    );
  }

  Widget _build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: banner.image,
      imageBuilder: (context, image) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.cover)),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      placeholder: (context, url) {
        return Center(child: Container(
          height: 100,
          width: 100,
          child: Lottie.asset(
            'assets/lottie/trail_loading.json',
          ),
        ));
      },
      errorWidget: (context, url, error) {
        return Center(child: WidgetCachedImageError());
      },
      fit: AppValue.IMAGE_FIT_MODE,
      filterQuality: FilterQuality.low,
    );
  }
}
