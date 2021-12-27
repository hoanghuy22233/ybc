import 'package:flutter/material.dart';

import 'barrel_profile_detail.dart';

class WidgetProfileDetailImage extends StatelessWidget {
  final String avatarUrl;

  const WidgetProfileDetailImage({Key key, @required this.avatarUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Colors.white,
                child: AspectRatio(
                  aspectRatio: 3.25,
                ),
              ),
            ],
          ),
          WidgetProfileDetailAvatar(
            avatarUrl: avatarUrl,
          ),
        ],
      ),
    );
  }
}
