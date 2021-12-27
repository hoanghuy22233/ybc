import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/model/entity/post.dart';
import 'package:ybc/presentation/common_widgets/widget_cached_image.dart';
import 'package:ybc/presentation/screen/work_home/menu/news/news_detail/sc_news_detail.dart';

class ChildWorkOne extends StatelessWidget {
  final Post post;
  const ChildWorkOne({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // AppNavigator.navigateNewsDetail(post.id);
        _openDetailsPage(context);
      },
      child: Card(
        margin: EdgeInsets.only(left: 10, bottom: 20, right: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 2.5,
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: AspectRatio(
                  aspectRatio: AppValue.NEWS_IMAGE_RATIO,
                  child: WidgetCachedImage(
                    url: post.image,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      post.name,
                      style: AppStyle.DEFAULT_SMALL
                          .copyWith(color: AppColor.BLACK),
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _openDetailsPage(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NewsDetailScreen(
                id: post.id,
              )));
}
