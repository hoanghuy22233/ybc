import 'package:flutter/material.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/model/entity_offline/bank_name.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_account/widget_appbar_not_search.dart';
import 'package:ybc/presentation/screen/work_home/payments/widget_bank_item.dart';

class PaymentsScreen extends StatefulWidget {
  @override
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              _buildAppbar('Hình thức thanh toán'),
              Container(
                height: MediaQuery.of(context).size.height-140,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Chọn hình thức thanh toán',
                              style: AppStyle.DEFAULT_MEDIUM,
                            )),
                      ),
                      ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: allBank.length,
                          itemBuilder: (context, index) {
                            return WidgetBankItem(
                              bank: index,
                              onTap: () {},
                            );
                          }),
                      WidgetSpacer(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: RichText(
                          text: TextSpan(
                              text: "Lưu ý: ",
                              style:
                              AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.RED),
                              children: [
                                TextSpan(
                                    text:
                                    "Nội dung chuyển khoản ghi rõ Tên khách hàng, số điện thoại",
                                    style: AppStyle.DEFAULT_MEDIUM),
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(color: Colors.grey[300]),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Thành tiền',
                                style: AppStyle.DEFAULT_MEDIUM,
                              ),
                              Text(
                                '550 000 VNĐ',
                                style: AppStyle.DEFAULT_MEDIUM_BOLD
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildbottomNavigationBar(),
    );
  }

  Widget _buildAppbar(String title) => WidgetAppbarNotSearch(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        left: [
          WidgetAppbarMenuBack(),
        ],
        title: title,
      );

  _buildbottomNavigationBar() {
    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                scrollable: true,
                title: Text('Thanh toán thành công!',
                  style: AppStyle.DEFAULT_MEDIUM_BOLD,),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Lịch hẹn sẽ được gửi đến bạn và chuyên gia thông qua email.', style: AppStyle.DEFAULT_MEDIUM.copyWith(), textAlign: TextAlign.justify,),
                      SizedBox(height: 10,),
                      Text(
                          'Chúc bạn thành công!', style: AppStyle.DEFAULT_MEDIUM.copyWith(), textAlign: TextAlign.justify,),
                      SizedBox(height: 20,),
                      Center(
                        child: Container(
                          height: 60,
                          width: 60,
                          child: GestureDetector(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset('assets/images/happy.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  RaisedButton(
                      child: Text("Trở về"),
                      color: Colors.blue,
                      onPressed: () {
                        AppNavigator.navigateWorkService();
                      }
                  )
                ],
              );
            },
          );
        },
        child: Card(
          color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Text(
              "Tiến hành thanh toán",
              style: AppStyle.DEFAULT_MEDIUM.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
