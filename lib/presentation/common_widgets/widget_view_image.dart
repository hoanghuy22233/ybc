import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_account/widget_appbar_not_search.dart';

class WidgetViewNetworkImage extends StatelessWidget{
  final String image;

  const WidgetViewNetworkImage({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAppbar(''),
        Container(
          height: MediaQuery.of(context).size.height-100,
          width: MediaQuery.of(context).size.width,
          child: PhotoView(
            imageProvider: NetworkImage(image),
          ),
        ),
      ],
    );
  }

  Widget _buildAppbar(String title) => WidgetAppbarNotSearch(
    backgroundColor: Colors.black,
    textColor: Colors.white,
    left: [
      WidgetAppbarMenuBack(),
    ],
    title: title,
  );
}