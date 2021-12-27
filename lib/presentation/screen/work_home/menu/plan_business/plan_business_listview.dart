import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/entity_offline/work/newsItem.dart';
import 'package:ybc/model/entity_offline/work/planItem.dart';
import 'package:ybc/presentation/screen/work_home/menu/plan_business/detail_plan_business/sc_detail_plan_business.dart';
class PlanBusinessListView extends StatelessWidget {
  final int id;

  const PlanBusinessListView({Key key, this.id}) : super(key: key);

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
                    child: Image.asset('${planBusinessItem[id].image}', width: 130, height:  120, fit: BoxFit.cover,))),
            SizedBox(width: 15,),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${planBusinessItem[id].name}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12), ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          child: Image.asset("assets/images/skyline.png"),
                        ),
                        SizedBox(width: 5,),
                        Text('Quy mô: ${planBusinessItem[id].type}',style: TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          child: Image.asset("assets/images/money.png"),
                        ),
                        SizedBox(width: 5,),
                        planBusinessItem[id].priceNotSale != null ? Row(
                          children: [
                            Text(AppValue.APP_MONEY_FORMAT.format(planBusinessItem[id].priceNotSale) , style: TextStyle(fontSize: 10, color: Colors.red, decoration: TextDecoration.lineThrough), overflow: TextOverflow.ellipsis,),
                            SizedBox(width: 5,),
                          ],
                        ) : SizedBox(),
                        Text(planBusinessItem[id].price != null ? AppValue.APP_MONEY_FORMAT.format(planBusinessItem[id].price) : "Miễn phí", style: TextStyle(fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          child: Image.asset("assets/images/writer.png"),
                        ),
                        SizedBox(width: 5,),
                        Text('Tác giả: ${planBusinessItem[id].author}', style: TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          child: Image.asset("assets/images/suitcase.png"),
                        ),
                        SizedBox(width: 5,),
                        Text('Ngành: ${planBusinessItem[id].branch}',style: TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DetailPlanBusinessScreen(id: id,)),
                              );
                            },
                            child: Text("Chi tiết >>", style: TextStyle(fontSize: 12, color: Colors.blueAccent),))
                      ],
                    )
                  ],
                ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Column(
            //     children: [
            //       GestureDetector(
            //         onTap:(){
            //
            //         },
            //         child: Container(
            //             height: 30,
            //             width: 25,
            //             decoration: BoxDecoration(
            //                 color: Colors.blue[600]
            //             ),
            //             child: Icon(Icons.download_rounded, color: Colors.white,)),
            //       ),
            //       SizedBox(height: 10,),
            //       GestureDetector(
            //         onTap: (){
            //
            //         },
            //         child: Container(
            //             height: 30,
            //             width: 25,
            //             decoration: BoxDecoration(
            //                 color: Colors.grey[400]
            //             ),
            //             child: Icon(Icons.note_add_outlined, color: Colors.black,),),
            //       ),
            //
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
