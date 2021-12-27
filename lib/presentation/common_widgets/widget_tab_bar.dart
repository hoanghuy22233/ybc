import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:flutter/material.dart';

class WidgetTabBar extends StatelessWidget {
  final Category category;
  final bool isChoose;
  final Function(Category category) onTap;
  final TextStyle style;

  const WidgetTabBar(
      {Key key, this.category, this.isChoose = false, this.onTap, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(category),
      child: Container(
        child: Stack(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  child: Text(
                category.name,
                style: style,
                textAlign: TextAlign.center,
              )),
            )),
            isChoose
                ? Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FractionallySizedBox(
                        widthFactor: 0.5,
                        child: Divider(
                          color: AppColor.BLACK,
                          height: 0,
                          thickness: 1,
                        ),
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
