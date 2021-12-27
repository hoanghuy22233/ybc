import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/model/entity_offline/item_video.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/common_widgets/widget_view_image.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_appbar_not_search.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/livestream/widget_news_detail_video.dart';

class NewsVideoScreen extends StatefulWidget {
  final int id;
  final ValueChanged<double> onRatingChanged;
  final ValueChanged<String> onContentChanged;

  const NewsVideoScreen(
      {Key key, @required this.id, this.onContentChanged, this.onRatingChanged})
      : super(key: key);
  @override
  _NewsVideoScreenState createState() => _NewsVideoScreenState();
}

class _NewsVideoScreenState extends State<NewsVideoScreen> {
  int _newsId;
  ScrollController _scrollController;
  String text = "Mọi thứ đều ổn cho đến khi nhìn nút tải xuống 🙂";

  @override
  void initState() {
    super.initState();
    // _onArgument();
    _scrollController = ScrollController();
    // Future.delayed(Duration(seconds: 10), () {
    //   if (mounted)
    //     _scrollController.addListener(() {
    //       if (_scrollController.offset >=
    //               _scrollController.position.maxScrollExtent &&
    //           (BlocProvider.of<NewsCommentBloc>(context).state
    //               is NewsCommentLoaded)) {
    //         BlocProvider.of<NewsCommentBloc>(context)
    //             .add(RequestLoadNewsMoreComment());
    //       }
    //     });
    // });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.GREY_LIGHTER_3,
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              _buildAppbar(),
              Expanded(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: _scrollController,
                  child: _buildContent(),
                ),
              )
            ],
          ),
        ));
  }

  _buildAppbar() => WidgetAppbarNotSearch(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        title: "Chi tiết video",
        left: [WidgetAppbarMenuBack()],
      );

  Widget _buildContent() {
    return Column(
      children: [
        Container(
          height: 250,
          child: WidgetNewsDetailVideo(
            id: widget.id,
          ),
        ),
        Container(
          width: double.infinity,
          color: AppColor.WHITE,
          padding: EdgeInsets.all(AppValue.APP_HORIZONTAL_PADDING),
          child: Text(
            itemVideo[widget.id].nameLive,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: double.infinity,
          color: AppColor.WHITE,
          padding:
              EdgeInsets.symmetric(horizontal: AppValue.APP_HORIZONTAL_PADDING),
          child: Row(
            children: [
              Text(
                itemVideo[widget.id].view + "-",
                style: AppStyle.DEFAULT_SMALL.copyWith(color: AppColor.GREY),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                itemVideo[widget.id].createAt,
                style: AppStyle.DEFAULT_SMALL.copyWith(color: AppColor.GREY),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: AppColor.WHITE,
                  padding: EdgeInsets.all(AppValue.APP_HORIZONTAL_PADDING),
                  child: RatingBar(
                    initialRating: 4,
                    minRating: 1,
                    itemSize: 25,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    ratingWidget: RatingWidget(
                      empty: Icon(
                        Icons.star,
                        color: Colors.grey,
                      ),
                      full: Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      half: null,
                    ),
                    onRatingUpdate: widget.onRatingChanged,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(AppValue.APP_HORIZONTAL_PADDING),
                child: Text("4/5"),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.grey[300],
          padding: EdgeInsets.all(1),
        ),
        Container(
          width: double.infinity,
          color: AppColor.WHITE,
          padding: EdgeInsets.all(AppValue.APP_HORIZONTAL_PADDING),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue[600]),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.only(
                      top: 5,
                      left: 5,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WidgetViewNetworkImage(
                                    image:
                                        "https://picsum.photos/250?image=9")),
                          );
                        },
                        child: CachedNetworkImage(
                          imageUrl: 'https://picsum.photos/250?image=9',
                          fit: BoxFit.fill,
                          placeholder: (context, url) =>
                              new CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  child: itemVideo[widget.id].dia != null
                      ? Text(
                          itemVideo[widget.id].dia.length <= 40
                              ? itemVideo[widget.id].dia
                              : itemVideo[widget.id].dia.substring(0, 40) +
                                  '...',
                          style: AppStyle.DEFAULT_SMALL
                              .copyWith(color: AppColor.GREY),
                          textAlign: TextAlign.start,
                        )
                      : Container())
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.grey[300],
          padding: EdgeInsets.all(1),
        ),
        Container(
          width: double.infinity,
          color: AppColor.WHITE,
          padding: EdgeInsets.all(AppValue.APP_HORIZONTAL_PADDING),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Bình luận" + " 12",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/img_chevron_bottom.png",
                    height: 15,
                    width: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue[600]),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        margin: EdgeInsets.only(
                          top: 5,
                          left: 5,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WidgetViewNetworkImage(
                                        image:
                                            "https://picsum.photos/250?image=9")),
                              );
                            },
                            child: CachedNetworkImage(
                              imageUrl: 'https://picsum.photos/250?image=9',
                              fit: BoxFit.fill,
                              placeholder: (context, url) =>
                                  new CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  new Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      child: text != null
                          ? Text(
                              text.length <= 30
                                  ? text
                                  : text.substring(0, 30) + '...',
                              style: AppStyle.DEFAULT_SMALL
                                  .copyWith(color: AppColor.GREY),
                              textAlign: TextAlign.start,
                            )
                          : Container())
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
