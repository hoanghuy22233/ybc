import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class WidgetProfileMenu extends StatelessWidget {
  final Widget image;
  final String text;
  final String endText;
  final Function onTap;

  const WidgetProfileMenu(
      {Key key, this.image, this.text, this.endText, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
//                  AspectRatio(
//                      aspectRatio: 1,
//                      child: Container(
//                          child: Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: image,
//                          ))),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Text(
                        text,
                        style: AppStyle.DEFAULT_MEDIUM,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        endText ?? '',
                        style: AppStyle.DEFAULT_MEDIUM_BOLD,
                      ),
                    ),
                  ),
                  WidgetSpacer(
                    width: 5,
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: AppColor.GREY,
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 0.1,
            thickness: 0.5,
            color: AppColor.GREY,
          ),
        ],
      ),
    );
  }
}
