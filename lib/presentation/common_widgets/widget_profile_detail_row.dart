import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';

class WidgetProfileDetailRow extends StatelessWidget {
  final String title;
  final String content;
  final Function onTap;

  const WidgetProfileDetailRow({Key key, this.title, this.content, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              color: Colors.grey.withOpacity(0.2),
              padding: EdgeInsets.symmetric(
                  horizontal: AppValue.APP_HORIZONTAL_PADDING + 10,
                  vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      content,
                      style: AppStyle.DEFAULT_MEDIUM
                          .copyWith(color: AppColor.PRIMARY),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: AppColor.GREY,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
