import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:flutter/material.dart';

class WidgetCircleSale extends StatelessWidget {
  final String saleOff;

  const WidgetCircleSale({Key key, this.saleOff}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: AppValue.PRODUCT_HORIZONTAL_SALE,
          height: AppValue.PRODUCT_HORIZONTAL_SALE,
          decoration: BoxDecoration(
              color: Color(0xFFD0CBCA),
              borderRadius: BorderRadius.circular(500)),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: AppValue.PRODUCT_HORIZONTAL_SALE - 10,
              height: AppValue.PRODUCT_HORIZONTAL_SALE - 10,
              decoration: BoxDecoration(
                  color: AppColor.SECONDARY_COLOR,
                  borderRadius: BorderRadius.circular(500)),
              child: Center(
                child: Text(
                  '-$saleOff%',
                  style: AppStyle.DEFAULT_SMALL.copyWith(color: AppColor.WHITE),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
