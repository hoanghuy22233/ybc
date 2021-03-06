import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class WidgetImageViewerGallery extends StatelessWidget {
  final List<String> images;
  final int initialPosition;
  final PageController controller;

  WidgetImageViewerGallery({this.images, this.initialPosition})
      : controller = PageController(initialPage: initialPosition);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.navigateBack();
      },
      child: Container(
          child: PhotoViewGallery.builder(
        pageController: controller,
        scaleStateChangedCallback: (state) {
          if (!state.isScaleStateZooming) AppNavigator.navigateBack();
        },
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(images[index]),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained,
          );
        },
        itemCount: images.length,
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes,
            ),
          ),
        ),
      )),
    );
  }
}
