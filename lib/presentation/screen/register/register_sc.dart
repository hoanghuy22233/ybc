import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/utils/more/BHColors.dart';

// class CreateNewAccount extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             SizedBox(
//               height: size.width * 0.1,
//             ),
//             Image.asset(
//               "assets/images/header_background.png",
//               height: MediaQuery.of(context).size.width * 0.6,
//               width: MediaQuery.of(context).size.width,
//               fit: BoxFit.cover,
//             ),
//             Column(
//               children: [
//                 TextInputField(
//                   icon: FontAwesomeIcons.user,
//                   hint: AppLocalizations.of(context).translate('register.name'),
//                   inputType: TextInputType.name,
//                   inputAction: TextInputAction.next,
//                 ),
//                 TextInputField(
//                   icon: FontAwesomeIcons.envelope,
//                   hint: AppLocalizations.of(context).translate('email.name'),
//                   inputType: TextInputType.emailAddress,
//                   inputAction: TextInputAction.next,
//                 ),
//                 PasswordInput(
//                   icon: FontAwesomeIcons.lock,
//                   hint: AppLocalizations.of(context)
//                       .translate('register.password'),
//                   inputAction: TextInputAction.next,
//                 ),
//                 PasswordInput(
//                   icon: FontAwesomeIcons.lock,
//                   hint: AppLocalizations.of(context)
//                       .translate('forgot_password_reset.confirm_password_hint'),
//                   inputAction: TextInputAction.done,
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Container(
//                   height: size.height * 0.08,
//                   width: size.width * 0.8,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16),
//                     color: Color(0xff5663ff),
//                   ),
//                   child: FlatButton(
//                     onPressed: () {
//                       AppNavigator.navigateRegisterVerifi();
//                     },
//                     child: Text(
//                       AppLocalizations.of(context).translate('login.register'),
//                       style: TextStyle(
//                           fontSize: 16, color: Colors.white, height: 1.5)
//                           .copyWith(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       AppLocalizations.of(context)
//                           .translate('forgot_password.have_account'),
//                       style: TextStyle(
//                           fontSize: 16, color: Colors.grey, height: 1.5),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         AppNavigator.navigateLogin();
//                       },
//                       child: Text(
//                         AppLocalizations.of(context)
//                             .translate('register.login'),
//                         style: TextStyle(
//                             fontSize: 16, color: Colors.grey, height: 1.5)
//                             .copyWith(
//                             color: Color(0xff5663ff),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
class CreateNewAccount extends StatefulWidget {
  static String tag = '/NewRegistrationScreen';

  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  bool _showPassword = false;
  bool _showCormfirmPassword = false;
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController fullNameCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  TextEditingController confirmPassCont = TextEditingController();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode dobFocusNode = FocusNode();
  FocusNode confirmPassFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    fullNameFocusNode.dispose();
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    dobFocusNode.dispose();
    confirmPassCont.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //changeStatusColor(BHColorPrimary);

    return Scaffold(
      backgroundColor: BHColorPrimary,
      body: SafeArea(
        top: false,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 15),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //SizedBox(height: 75,),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Image.asset("assets/images/ybc.png",
                          //  color: Colors.white.withOpacity(0.8),
                          height: 90,
                          width: 90),
                      SizedBox(width: 25,),
                      Text("YBC Startups", style: TextStyle(
                          fontSize: 24,
                          color: Colors.blue,
                          fontFamily: 'Righteous'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 75,),
                TextFormField(
                  controller: fullNameCont,
                  focusNode: fullNameFocusNode,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(dobFocusNode);
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset("assets/images/ic_user.png", height: 3, width: 3, fit: BoxFit.fill,color: Colors.grey,),
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
                    labelText: "Họ tên",
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    suffixIcon: GestureDetector(
                      onTap: (){
                        this.fullNameCont.clear();
                      },
                      child: Icon(Icons.highlight_remove,
                          color: Colors.grey,
                          size: 20),
                    ),
                  ),
                ),
                SizedBox(height: 15,
                ),TextFormField(
                  controller: phoneCont,
                  focusNode: dobFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(emailFocusNode);
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset("assets/images/ic_phone.png", height: 3, width: 3, fit: BoxFit.fill,color: Colors.grey,
                    ),
                        ),focusedBorder: OutlineInputBorder(
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
                    labelText: "Số điện thoại",
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    suffixIcon: GestureDetector(
                      onTap: (){
                        this.phoneCont.clear();
                      },
                      child: Icon(Icons.highlight_remove,
                          color: Colors.grey,
                          size: 20),
                    ),
                  ),
                ),
                SizedBox(height: 15,
                ),TextFormField(
                  controller: emailCont,
                  focusNode: emailFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(passwordFocusNode);
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset("assets/images/ic_email.png", height: 3, width: 3, fit: BoxFit.fill,color: Colors.grey,),
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
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    suffixIcon: GestureDetector(
                      onTap: (){
                        this.emailCont.clear();
                      },
                      child: Icon(Icons.highlight_remove,
                          color: Colors.grey,
                          size: 20),
                    ),
                  ),
                ),
                SizedBox(height: 15,
                ),TextFormField(
                  controller: passwordCont,
                  focusNode: passwordFocusNode,
                  obscureText: !_showPassword,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(confirmPassFocusNode);
                  },
                  decoration: InputDecoration(
                    labelText: "Mật khẩu",
                    labelStyle: TextStyle(color: BHGreyColor, fontSize: 14),
                    contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 20.0, 10.0),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset("assets/images/ic_key.png", height: 5, width: 5, fit: BoxFit.fill,color: Colors.grey,),
                        ),
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
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: confirmPassCont,
                  focusNode: confirmPassFocusNode,
                  obscureText: !_showCormfirmPassword,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),

                  decoration: InputDecoration(
                    labelText: "Nhập lại mật khẩu",
                    labelStyle: TextStyle(color: BHGreyColor, fontSize: 14),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset("assets/images/ic_key.png", height: 5, width: 5, fit: BoxFit.fill,color: Colors.grey,),
                        ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showCormfirmPassword = !_showCormfirmPassword;
                        });
                      },
                      child: Icon(
                          _showCormfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                          size: 20),
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
                  ),
                ),


                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    padding: EdgeInsets.all(12),
                    onPressed: () {
                      //Navigator.pop(context);
                      AppNavigator.navigateWorkService();
                    },
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Text(
                      'Hoàn tất',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
