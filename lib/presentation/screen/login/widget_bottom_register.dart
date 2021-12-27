import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/screen/login/widget_social_button.dart';
import 'package:ybc/utils/more/BHColors.dart';
import 'package:ybc/utils/more/BHConstants.dart';
import 'package:ybc/utils/utils.dart';

class WidgetBottomRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Text(
            "Đăng Ký/ Đăng nhập đồng nghĩa là bạn đồng ý với",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                    color: BHAppTextColorSecondary, fontSize: 12),
                children: <TextSpan>[
                  TextSpan(
                      text: "Thoả thuận người dùng ",
                      style: TextStyle(color: Colors.blue, fontSize: 12)),
                  TextSpan(
                      text: 'và ',
                      style:
                      TextStyle(color: Colors.black, fontSize: 12)),
                  TextSpan(
                      text: 'Chính sách bảo mật',
                      style: TextStyle(color: Colors.blue, fontSize: 12)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
