import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:ybc/model/entity_offline/template.dart';
import 'widget_submit_button.dart';

class WidgetTemplateDescription extends StatelessWidget {
  final int index;

  const WidgetTemplateDescription({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          Text("${allTemplate[index].name}"),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothStarRating(
                rating: allTemplate[index].star,
                isReadOnly: true ,
                size: 25,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.star_half,
                defaultIconData: Icons.star_border,
                starCount: 5,
                borderColor: Colors.amber,
                color: Colors.amber,
                allowHalfRating: true,
                spacing: 2.0,
                onRated: (value) {
                  print("rating value -> $value");
                  // print("rating value dd -> ${value.truncate()}");
                },
              ),
              Text('${allTemplate[index].reivew}'),
            ],
          ),
          SizedBox(height: 10,),
          allTemplate[index].isFree == 1 ? Text("Miễn phí", style: TextStyle(color: Colors.blue),) :
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${allTemplate[index].salePrice}", style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold
              ),),
              SizedBox(width: 15,),
              Text("${allTemplate[index].price}", style: TextStyle(
                  decoration: TextDecoration.lineThrough
              ),),

            ],
          ),
          SizedBox(height: 10,),
          allTemplate[index].isFree == 1 ? WidgetSubmitButton(
            firstColor: Colors.green,
            secondColor: Colors.blue,
            firstText: 'Sử dụng',
            secondText: 'Tải về',
            firstTextColor: Colors.white,
            secondTextColor: Colors.white,
            spaceBetween: 10,
            secondIcon: Image.asset("assets/images/ic_cloud.png", width: 20, height: 20, color: Colors.white, ),
          ) :WidgetSubmitButton(
            firstColor: Colors.red,
            secondColor: Colors.grey[100],
            firstText: 'Mua hàng',
            secondText: 'Giỏ hàng',
            firstTextColor: Colors.white,
            secondTextColor: Colors.black,
            spaceBetween: 10,
            secondIcon: Image.asset("assets/icons/ic_cart.png", width: 20, height: 20, color: Colors.black, ),
          ),
          SizedBox(height: 15,),
        ],
      ),
    );
  }

}


