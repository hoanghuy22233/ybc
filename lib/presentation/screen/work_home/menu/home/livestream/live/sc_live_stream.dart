import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/model/entity_offline/item_video.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/livestream/widget_live_stream.dart';

class ListVideoStreamScreen extends StatefulWidget {
  ListVideoStreamScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ListVideoStreamScreenState createState() => _ListVideoStreamScreenState();
}

class _ListVideoStreamScreenState extends State<ListVideoStreamScreen>
    with AutomaticKeepAliveClientMixin<ListVideoStreamScreen> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _buildContent(),
        )
      ],
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  Widget _buildContent() {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return WidgetStreamLive(id: index);
      },
//                  itemExtent: 100.0,
      itemCount: itemVideo.length,
      separatorBuilder: (context, index) {
        return WidgetSpacer(height: 5);
      },
      physics: BouncingScrollPhysics(),
    );
  }
}
