import 'package:flutter/material.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:ybc/presentation/common_widgets/widget_cached_image.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';

class WidgetCategories extends StatelessWidget {
  final HomeData category;
  final bool justName;

  const WidgetCategories(
      {Key key, @required this.category, this.justName = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // AppNavigator.navigateCategoryPrimary(category);
      },
      child: AspectRatio(
        aspectRatio: justName
            ? AppValue.CATEGORIES_RATIO_NAME
            : AppValue.CATEGORIES_RATIO,
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          child: justName
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    category.name?.toUpperCase() ?? "",
                    textAlign: TextAlign.center,
                    style: AppStyle.DEFAULT_SMALL.copyWith(
                        color: AppColor.PRIMARY, fontWeight: FontWeight.w600),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 0.6,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFF6F6F6),
                                borderRadius: BorderRadius.circular(500),
                                border: Border.all(
                                    color: Color(0xFFEDEDED), width: 3)),
                            child: FractionallySizedBox(
                              widthFactor: 0.5,
                              heightFactor: 0.5,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: WidgetCachedImage(
                                  url: category.post[0].image,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      WidgetSpacer(
                        height: 5,
                      ),
                      Text(
                        category.name,
                        style: AppStyle.DEFAULT_VERY_SMALL,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
