import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/entity_offline/work/planItem.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_appbar_with_search.dart';
import 'package:ybc/presentation/screen/work_home/menu/plan_business/widget_button.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/widget_cart_appbar_menu.dart';

class DetailPlanBusinessScreen extends StatefulWidget {
  final int id;
  const DetailPlanBusinessScreen({Key key, this.id}) : super(key: key);

  @override
  _DetailPlanBusinessScreenState createState() =>
      _DetailPlanBusinessScreenState();
}

class _DetailPlanBusinessScreenState extends State<DetailPlanBusinessScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            _buildAppbar(
                "Mẫu kế hoạch kinh doanh", "Tìm kiếm theo ngành hoặc tác giả"),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20))),
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  '${planBusinessItem[widget.id].image}',
                                  fit: BoxFit.cover,
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${planBusinessItem[widget.id].name}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 10,
                                              width: 10,
                                              child: Image.asset(
                                                  "assets/images/skyline.png"),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Quy mô: ${planBusinessItem[widget.id].type}',
                                              style: TextStyle(fontSize: 14),
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
                                              child: Image.asset(
                                                  "assets/images/money.png"),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            planBusinessItem[widget.id]
                                                        .priceNotSale !=
                                                    null
                                                ? Row(
                                                    children: [
                                                      Text(
                                                        AppValue.APP_MONEY_FORMAT
                                                            .format(
                                                                planBusinessItem[
                                                                        widget.id]
                                                                    .priceNotSale),
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.red,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough),
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                    ],
                                                  )
                                                : SizedBox(),
                                            Text(
                                              planBusinessItem[widget.id].price !=
                                                      null
                                                  ? AppValue.APP_MONEY_FORMAT
                                                      .format(planBusinessItem[
                                                              widget.id]
                                                          .price)
                                                  : "Miễn phí",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
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
                                              child: Image.asset(
                                                  "assets/images/writer.png"),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Tác giả: ${planBusinessItem[widget.id].author}',
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
                                              child: Image.asset(
                                                  "assets/images/suitcase.png"),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Ngành: ${planBusinessItem[widget.id].branch}',
                                              style: TextStyle(fontSize: 12),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Expanded(
                                  //   flex: 1,
                                  //   child: Column(
                                  //     crossAxisAlignment: CrossAxisAlignment.end,
                                  //     children: [
                                  //       SizedBox(
                                  //         height: 10,
                                  //       ),
                                  //       _buildButtonBuy(),
                                  //       _buildButtonDownload(),
                                  //       _buildButtonCart(),
                                  //       _buildButtonsample(),
                                  //       SizedBox(
                                  //         height: 10,
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 5,
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 15, right: 10, top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildContent(
                                "Giới thiệu", planBusinessItem[widget.id].intro),
                            _buildContent("Nội dung mẫu kinh doanh",
                                planBusinessItem[widget.id].content),
                            _buildContent("Thông tin tác giả",
                                planBusinessItem[widget.id].infoAuthor),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildAppbar(String title, String titleSearch) => WidgetAppbarWithSearch(
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      left: [
        WidgetAppbarMenuBack(),
      ],
      right: [
        WidgetCartAppBarMenu()
      ],
      title: title,
      titleSearch: titleSearch,
    );

Widget _buildButtonBuy() => WidgetButton(
      text: "Mua ngay",
      textColor: Colors.white,
      image: Icon(
        Icons.attach_money_outlined,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      height: 30,
      width: 100,
      isEnable: true,
      onTap: () {
        AppNavigator.navigateCart();
      },
    );

Widget _buildButtonDownload() => WidgetButton(
      text: "Tải về",
      textColor: Colors.white,
      image: Icon(
        Icons.cloud_download_outlined,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      height: 30,
      width: 100,
      isEnable: true,
      onTap: () {
        // AppNavigator.navigateCart();
      },
    );

Widget _buildButtonCart() => WidgetButton(
      text: "Giỏ hàng",
      image: Icon(
        Icons.add_shopping_cart,
        color: Colors.black,
      ),
      backgroundColor: Colors.grey[400],
      height: 30,
      width: 100,
      isEnable: true,
      onTap: () {
        AppNavigator.navigateCart();
      },
    );

Widget _buildButtonsample() => WidgetButton(
      text: "Tạo mẫu",
      image: Icon(
        Icons.note_add_outlined,
        color: Colors.black,
      ),
      backgroundColor: Colors.grey[400],
      height: 30,
      width: 100,
      isEnable: true,
      onTap: () {
        AppNavigator.navigateCreateSamplePlan();
      },
    );

Widget _buildContent(String title, String content) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(
            Icons.circle,
            size: 10,
            color: Colors.blue,
          ),
          SizedBox(
            width: 5,
          ),
          Text(title, style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith()),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Container(
          padding: EdgeInsets.only(left: 15, bottom: 15),
          child: Text(
            content,
            style: AppStyle.DEFAULT_SMALL.copyWith(),
            textAlign: TextAlign.justify,
          )),
    ],
  );
}
