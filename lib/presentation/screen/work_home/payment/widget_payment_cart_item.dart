import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/model/entity/cart.dart';

class WidgetPaymentCartItem extends StatelessWidget {
  final Cart cart;

  const WidgetPaymentCartItem({
    Key key,
    @required this.cart,
  }) : super(key: key);

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
                    imageUrl: cart.image ?? 'https://picsum.photos/250?image=9',
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
                      '${cart.name}',
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
                          'Quy mô: ${cart.categoryName}',
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
                          'Tác giả: ${cart.lecturerName}',
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
                          'Ngành: ${cart.categoryName}',
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
                            AppValue.APP_MONEY_FORMAT.format(cart.finalPrice),
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
