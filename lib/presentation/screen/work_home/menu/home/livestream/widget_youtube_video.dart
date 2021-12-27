import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WidgetYoutubeVideo extends StatefulWidget {
  final String videoUrl;

  const WidgetYoutubeVideo({Key key, this.videoUrl}) : super(key: key);
  @override
  _WidgetYoutubeVideoState createState() => _WidgetYoutubeVideoState();
}

class _WidgetYoutubeVideoState extends State<WidgetYoutubeVideo> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    String videoId;
    videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
//      videoProgressIndicatorColor: Colors.amber,
//      progressColors: ProgressColors(
//        playedColor: Colors.amber,
//        handleColor: Colors.amberAccent,
//      ),
      onReady: () {
        print('Player is ready.');
      },
    );
  }
}
