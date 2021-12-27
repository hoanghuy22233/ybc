import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class WidgetImageViewer extends StatelessWidget {
  final ImageProvider imageProvider;

  WidgetImageViewer({this.imageProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoView(
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained,
      imageProvider: imageProvider,
    ));
  }
}
