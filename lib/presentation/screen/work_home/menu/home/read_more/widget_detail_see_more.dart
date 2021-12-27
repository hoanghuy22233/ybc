import 'package:flutter/material.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/model/entity/post_detail.dart';
import 'package:ybc/presentation/common_widgets/widget_cached_image.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_detail/sc_news_detail.dart';

class WidgetDetailSeeMore extends StatelessWidget {
  final PostDetail news;

  const WidgetDetailSeeMore({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // AppNavigator.navigateNewsDetail(news.id);
        _openDetailsPage(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: AppValue.NEWS_IMAGE_RATIO,
                    child: WidgetCachedImage(
                      url: news.image,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            news.name,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyle.DEFAULT_SMALL
                                .copyWith(color: AppColor.PRIMARY),
                          ),
                          WidgetSpacer(
                            height: 3,
                          ),
                          Expanded(
                            child: Container(
                                child: news?.intro != null
                                    ? Text(
                                        news.intro.length <= 70
                                            ? news.intro
                                            : news.intro.substring(0, 70) +
                                                '...',
                                        style: AppStyle.DEFAULT_SMALL
                                            .copyWith(color: AppColor.GREY),
                                        textAlign: TextAlign.start,
                                      )
                                    : Container()),
                          ),
                          WidgetSpacer(
                            height: 3,
                          ),
                          Text(
                            news.createdAt,
                            style: AppStyle.DEFAULT_SMALL
                                .copyWith(color: AppColor.GREY),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _openDetailsPage(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NewsDetailScreen(
                id: news.id,
              )));
}
