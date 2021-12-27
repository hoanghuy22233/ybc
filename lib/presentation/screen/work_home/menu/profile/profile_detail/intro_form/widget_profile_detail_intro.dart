import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';

class WidgetProfileDetailIntro extends StatelessWidget {
  final String title;
  final String content;
  final Function onTap;

  const WidgetProfileDetailIntro(
      {Key key, this.title, this.content, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.grey.withOpacity(0.2),
              padding: EdgeInsets.symmetric(
                  horizontal: AppValue.APP_HORIZONTAL_PADDING + 10,
                  vertical: 40),
              child: Text(
                content,
                style:
                    AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.PRIMARY),
              ),
            )),
      ),
    );
  }
}
