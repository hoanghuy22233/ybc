import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';

import '../../app/constants/barrel_constants.dart';

class WidgetCategoriesMore extends StatelessWidget {
  final String name;
  final Color background;
  final Color titleColor;
  final Function actionMore;
  final String tag;

  WidgetCategoriesMore(
      {Key key,
      this.name,
      this.tag,
      this.background,
      this.actionMore,
      this.titleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: background ?? AppColor.PRIMARY,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: tag != null
                  ? Hero(
                      tag: tag,
                      child: Text(
                        name.toUpperCase(),
                        style: AppStyle.DEFAULT_MEDIUM.copyWith(
                            color: titleColor ?? Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : Text(
                      name.toUpperCase(),
                      style: AppStyle.DEFAULT_MEDIUM.copyWith(
                          color: titleColor ?? Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
            ),
            InkWell(
              onTap: actionMore,
              child: Text(
                AppLocalizations.of(context).translate('all.read_more'),
                style: AppStyle.DEFAULT_SMALL
                    .copyWith(color: titleColor ?? Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
