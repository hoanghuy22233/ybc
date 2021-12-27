import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/entity/order_item.dart';

import 'order_detail_item.dart';


class WidgetOrderItem extends StatelessWidget {
  final OrderItem orderItem;

  const WidgetOrderItem({Key key, this.orderItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppNavigator.navigateCourserDetail(orderItem.courseId);
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 60,
                        width: 60,
                        child: CachedNetworkImage(
                          imageUrl: orderItem.image ??
                              'https://picsum.photos/250?image=9',
                          fit: BoxFit.fill,
                          placeholder: (context, url) =>
                          new CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(child: Text(orderItem.name.length < 30 ? orderItem.name : orderItem.name.substring(0, 30) + '...',))
                    ),
                  ],
                ),
              ),
              widgetRow('Mã đơn hàng:', orderItem.id.toString()),
              widgetRow('Thời gian đặt hàng:', orderItem.createdAt),
              widgetRow('Trạng thái:', statusToString(orderItem.status)),
              widgetRow('Tổng tiền hàng:', AppValue.APP_MONEY_FORMAT.format(orderItem.totalPrice)),

            ],
          ),
        ),
      ),
    );
  }

  widgetRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(title, style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: Colors.black, fontSize: 14))
          ),
          Expanded(
            flex: 3,
            child: Text(value, style: AppStyle.DEFAULT_MEDIUM.copyWith(color: Colors.black, fontSize: 13),)
          ),
        ],
      ),
    );
  }

  String statusToString(int type){
    if(type == 0) return 'Đã bị hủy';
    else if(type == 1) return 'Đang đợi duyệt';
    else if(type == 2) return 'Đã hoàn thành';
    }
}
