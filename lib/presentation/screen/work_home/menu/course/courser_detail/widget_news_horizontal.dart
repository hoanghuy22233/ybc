import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/model/entity/news.dart';
import 'package:ybc/presentation/common_widgets/widget_cached_image_error.dart';
import 'package:ybc/presentation/common_widgets/widget_circle_progress.dart';

class WidgetNewsHorizontal extends StatelessWidget {
  final News news;

  const WidgetNewsHorizontal({Key key, @required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.navigateNewsDetail(news.id);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 4, bottom: 4, left: 15),
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Container(
            width: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: AppValue.BANNER_RATIO,
                  child: image(context),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 6),
                    child: Text(
                      '${news.name}',
                      style: AppStyle.DEFAULT_SMALL,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget image(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        imageUrl: news.image,
        imageBuilder: (context, image) => Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: image, fit: BoxFit.fill),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4), topRight: Radius.circular(4))),
        ),
        placeholder: (context, url) {
          return Center(child: WidgetCircleProgress());
        },
        errorWidget: (context, url, error) {
          return Center(child: WidgetCachedImageError());
        },
        fit: AppValue.IMAGE_FIT_MODE,
        filterQuality: FilterQuality.low,
      ),
    );
  }
}
