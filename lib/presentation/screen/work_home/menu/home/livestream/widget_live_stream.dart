import 'package:flutter/material.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/model/entity_offline/item_video.dart';
import 'package:ybc/presentation/common_widgets/widget_cached_image.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/livestream/detail_video/sc_video_detail.dart';

class WidgetStreamLive extends StatelessWidget {
  final int id;

  const WidgetStreamLive({Key key, this.id}) : super(key: key);

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
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      AspectRatio(
                        aspectRatio: AppValue.NEWS_IMAGE_RATIO,
                        child: WidgetCachedImage(
                          url: itemVideo[id].image,
                        ),
                      ),
                      Image.asset(
                        "assets/icons/live.png",
                        height: 25,
                      )
                    ],
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
                            itemVideo[id].name,
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
                                child: itemVideo[id].intro != null
                                    ? Text(
                                        itemVideo[id].intro.length <= 70
                                            ? itemVideo[id].intro
                                            : itemVideo[id]
                                                    .intro
                                                    .substring(0, 70) +
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
                          Row(
                            children: [
                              Text(
                                itemVideo[id].view + "-",
                                style: AppStyle.DEFAULT_SMALL
                                    .copyWith(color: AppColor.GREY),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                itemVideo[id].createAt,
                                style: AppStyle.DEFAULT_SMALL
                                    .copyWith(color: AppColor.GREY),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
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
          builder: (context) => NewsVideoScreen(
                id: id,
              )));
}
