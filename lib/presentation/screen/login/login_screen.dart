import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/utils/more/BHColors.dart';
import 'package:ybc/utils/more/BHConstants.dart';

class LoginScreenPage extends StatefulWidget {
  static String tag = '/LoginScreen';

  @override
  _LoginScreenPageState createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  @override
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  bool _showPassword = false;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailFocusNode.dispose();
    passWordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // changeStatusColor(BHColorPrimary);
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Image.asset("assets/images/ybc.png",
                          //  color: Colors.white.withOpacity(0.8),
                          height: 90,
                          width: 90),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "VDONE Startups",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue,
                            fontFamily: 'Righteous'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                TextFormField(
                  controller: emailCont,
                  focusNode: emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(passWordFocusNode);
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "assets/images/ic_user.png",
                        height: 3,
                        width: 3,
                        fit: BoxFit.fill,
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    labelText: "Số điện thoại/ Email",
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        this.emailCont.clear();
                      },
                      child: Icon(Icons.highlight_remove,
                          color: Colors.grey, size: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passwordCont,
                  focusNode: passWordFocusNode,
                  obscureText: !_showPassword,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "assets/images/ic_key.png",
                        height: 5,
                        width: 5,
                        fit: BoxFit.fill,
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    labelText: "Mật khẩu",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      child: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                          size: 20),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () => AppNavigator.navigateWorkService(),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue),
                    child: Text("Đăng nhập",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   child: RaisedButton(
                //     padding: EdgeInsets.all(12),
                //     onPressed: () {
                //       AppNavigator.navigateWorkService();
                //     },
                //     color: Colors.blue,
                //     shape: RoundedRectangleBorder(
                //
                //         borderRadius: BorderRadius.circular(25.0)),
                //     child: Text("Đăng nhập",
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 15,
                //             fontWeight: FontWeight.bold)),
                //   ),
                // ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () => AppNavigator.navigateRegister(),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent,
                        border: Border.all(color: Colors.blue, width: 2)),
                    child: Text("Đăng Ký",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      // BHForgotPasswordScreen().launch(context);
                      AppNavigator.navigateForgotPass();
                    },
                    child: Text(BHTxtForgetPwd,
                        style: TextStyle(
                            color: BHAppTextColorSecondary, fontSize: 14)),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Text(BHTxtOrSignIn, style: TextStyle(color: BHGreyColor)),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/icons/facebook.png",
                          height: 40, width: 40),
                      Image.asset("assets/icons/google.png",
                          height: 40, width: 40),
                      Image.asset(
                        "assets/images/apple-logo.png",
                        height: 40,
                        width: 40,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
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
                            text: 'Chính xác bảo mật',
                            style: TextStyle(color: Colors.blue, fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
