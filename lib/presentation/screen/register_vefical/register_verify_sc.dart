import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';

class RegisterVerifyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Mã xác nhận",
          style: TextStyle(fontSize: 16, color: Colors.black, height: 1.5),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/images/header_background.png",
            height: MediaQuery.of(context).size.width * 0.6,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width * 0.8,
                  child: Text(
                    "Mã xác nhận đã được gửi tới email:",
                    style: TextStyle(
                        fontSize: 16, color: Colors.black, height: 1.5),
                  ),
                ),
                Container(
                  width: size.width * 0.8,
                  child: Text(
                    "tai****@gmail.com",
                    style: TextStyle(
                        fontSize: 16, color: Colors.black, height: 1.5),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: _buildCodeField(),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: size.height * 0.08,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xff5663ff),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      AppNavigator.navigateLogin();
                    },
                    child: Text(
                      "Xác nhận",
                      style: TextStyle(
                              fontSize: 16, color: Colors.white, height: 1.5)
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCodeField() {
    return PinCodeTextField(
      onChanged: (changed) {},
      length: 6,
      obsecureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderWidth: 2,
        inactiveColor: Colors.white,
        inactiveFillColor: AppColor.GREY_LIGHTER_3,
        selectedColor: AppColor.GREY,
        selectedFillColor: AppColor.GREY,
        activeColor: AppColor.GREY_LIGHTER_3,
        activeFillColor: AppColor.GREY_LIGHTER_3,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      textInputType: TextInputType.phone,
      controller: null,
      onCompleted: (completed) {
        print("Completed: $completed");
      },
      beforeTextPaste: (text) {
        return true;
      },
    );
  }
}
