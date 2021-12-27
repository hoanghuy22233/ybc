import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:ybc/model/entity_offline/template.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_appbar_not_search.dart';
import 'package:ybc/presentation/screen/work_home/menu/plan_business/template_choose/widget_template_description.dart';

class ChooseTemplateScreen extends StatefulWidget {
  @override
  _ChooseTemplateScreenState createState() => _ChooseTemplateScreenState();
}

class _ChooseTemplateScreenState extends State<ChooseTemplateScreen> {
  int template = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              child: _buildAppbar("Lựa chọn Template")),

          Text('Chọn Mẫu Template', style: TextStyle(
            fontSize: 16
          ),),
          Expanded(
            child:
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset("${allTemplate[index].image}",) ;
              },
              onIndexChanged: (int index){
                setState(() {
                  template = index;
                  print(index);
                });
              },
              pagination: new SwiperPagination(
                alignment: Alignment.bottomCenter,

                builder: new DotSwiperPaginationBuilder(
                    color: Colors.grey, activeColor: Colors.blue),
              ),
              autoplay: false,
              viewportFraction: 0.5,
              scale: 0.1,
              itemCount: allTemplate.length,
              scrollDirection: Axis.horizontal,
              // control: new SwiperControl(),
            ),
          ),

          Container(child: _buildTemplateDescription(template)),

        ],
      ),

    );
  }
  Widget _buildTemplateDescription (int index) => WidgetTemplateDescription(index: index,);
  Widget _buildAppbar(String title) => WidgetAppbarNotSearch(
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    left: [
      WidgetAppbarMenuBack(),
    ],
    title: title,
  );
}
