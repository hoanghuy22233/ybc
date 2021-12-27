import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/entity/cart.dart';
import 'package:ybc/model/entity_offline/work/newsItem.dart';
import 'package:ybc/model/entity_offline/work/planItem.dart';
import 'package:ybc/presentation/screen/work_home/menu/plan_business/detail_plan_business/sc_detail_plan_business.dart';

class PlanBusinessItem extends StatelessWidget {
  final Cart cartItem;

  final Function onDeleteTap;

  const PlanBusinessItem({Key key, this.cartItem, this.onDeleteTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                        cartItem.image ?? 'https://picsum.photos/250?image=9',
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),

                  //Image.asset('${cartItem.image}', width: 130, height:  120, fit: BoxFit.cover,)
                )),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cartItem.name}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          child: Image.asset("assets/images/skyline.png"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Quy mô: ${cartItem.categoryName}',
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          child: Image.asset("assets/images/writer.png"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Tác giả: ${cartItem.lecturerName}',
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          child: Image.asset("assets/images/suitcase.png"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Ngành: ${cartItem.categoryName}',
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 15),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            AppValue.APP_MONEY_FORMAT
                                .format(cartItem.finalPrice),
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          )),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: onDeleteTap,
              borderRadius: BorderRadius.circular(500),
              child: Container(
                width: 30,
                height: 30,
                child: Icon(
                  Icons.close,
                  color: AppColor.GREY,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
