import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_youtube_view/flutter_youtube_view.dart';
import 'package:video_player/video_player.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/model/entity_offline/item_video.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/livestream/widget_youtube_video.dart';

class WidgetNewsDetailVideo extends StatefulWidget {
  final int id;

  const WidgetNewsDetailVideo({Key key, @required this.id}) : super(key: key);

  @override
  _WidgetNewsDetailVideoState createState() => _WidgetNewsDetailVideoState();
}

class _WidgetNewsDetailVideoState extends State<WidgetNewsDetailVideo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.network(itemVideo[widget.id].linkStream);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: AppValue.BANNER_RATIO,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  double _currentVideoSecond = 0.0;
  String _playerState = "";
//  FlutterYoutubeViewController _controller;

  @override
  void onCurrentSecond(double second) {
    print("onCurrentSecond second = $second");
    _currentVideoSecond = second;
  }

  @override
  void onError(String error) {
    print("onError error = $error");
  }

  @override
  void onReady() {
    print("onReady");
  }

  @override
  void onStateChange(String state) {
    print("onStateChange state = $state");
    setState(() {
      _playerState = state;
    });
  }

  @override
  void onVideoDuration(double duration) {
    print("onVideoDuration duration = $duration");
  }
//
//  void _onYoutubeCreated(FlutterYoutubeViewController controller) {
//    this._controller = controller;
//  }
//
//  void _loadOrCueVideo() {
//    _controller.loadOrCueVideo('gcj2RUWQZ60', _currentVideoSecond);
//  }

  @override
  Widget build(BuildContext context) {
    print('-widget.news.videoLink-');
    String link =
        'https://www.youtube.com/watch?v=' + itemVideo[widget.id].link;

    print(itemVideo[widget.id].link);
    return AspectRatio(
      aspectRatio: AppValue.BANNER_RATIO,
      child: Container(
        color: AppColor.RED,
        child: link.contains('youtube')
            ? WidgetYoutubeVideo(
                videoUrl: link,
              )
            : Chewie(
                controller: _chewieController,
              ),
      ),
    );
  }
}
