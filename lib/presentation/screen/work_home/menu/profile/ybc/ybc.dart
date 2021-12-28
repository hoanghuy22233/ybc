
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class YBCStartupScreen extends StatefulWidget {
  YBCStartupScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _YBCStartupScreenState createState() => _YBCStartupScreenState();
}

class _YBCStartupScreenState extends State<YBCStartupScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildNameCard(),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 5,
          ),
          _buildInfo(),
          SizedBox(
            height: 10,
          ),
          _buildContact(),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  _buildNameCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 70,
                width: 70,
                //margin: EdgeInsets.only(top: 5, left: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/images/ybc.png'),
                  // child: Image.network(state?.user?.image ??
                  //     'https://picsum.photos/250?image=9', fit: BoxFit.fill,),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("VDONE Startups",
                        style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith()),
                    SizedBox(
                      width: 10,
                    ),
                    Text("CLB Doanh nhân trẻ khởi nghiệp",
                        style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith()),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  _buildInfo() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cơ sở Hà Nội",
                style: AppStyle.DEFAULT_SMALL_BOLD.copyWith(),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.location_on_outlined,
                        size: 15,
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      flex: 14,
                      child: Text(
                        "Trụ sở chính : 18 Miếu Đầm - Nam Từ Liêm - Hà Nội",
                        style: AppStyle.DEFAULT_SMALL.copyWith(),
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                      )),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.email_outlined,
                        size: 15,
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      flex: 14,
                      child: GestureDetector(
                        onTap: () {
                          // Clipboard.setData(new ClipboardData(text: "ybcstartups@gmail.com"));
                          // ClipboardManager.copyToClipBoard(
                          //         "ybcstartups@gmail.com")
                          //     .then((result) {
                          //   final snackBar = SnackBar(
                          //     content: Text('Đã sao chép'),
                          //     action: SnackBarAction(
                          //       label: 'Trở về',
                          //       onPressed: () {},
                          //     ),
                          //     duration: Duration(seconds: 1),
                          //   );
                          //   Scaffold.of(context).showSnackBar(snackBar);
                          // });
                          Clipboard.setData(new ClipboardData(text: "ybcstartups@gmail.com"));
                          final snackBar = SnackBar(
                            content: Text('Đã copy'),
                            duration: Duration(seconds: 1),
                            backgroundColor: Colors.blue,
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {},
                            ),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        },
                        child: Text(
                          "Email: ybcstartups@gmail.com",
                          style: AppStyle.DEFAULT_SMALL.copyWith(),
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.phone_outlined,
                        size: 15,
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      flex: 14,
                      child: GestureDetector(
                        onTap: () {
                          // Clipboard.setData(new ClipboardData(text: "ybcstartups@gmail.com"));
                          // ClipboardManager.copyToClipBoard("0913 915 358")
                          //     .then((result) {
                          //   final snackBar = SnackBar(
                          //     content: Text('Đã sao chép'),
                          //     action: SnackBarAction(
                          //       label: 'Trở về',
                          //       onPressed: () {},
                          //     ),
                          //     duration: Duration(seconds: 1),
                          //   );
                          //   Scaffold.of(context).showSnackBar(snackBar);
                          // });
                          Clipboard.setData(new ClipboardData(text: "0913 915 358"));
                          final snackBar = SnackBar(
                            content: Text('Đã copy'),
                            backgroundColor: Colors.blue,
                            duration: Duration(seconds: 1),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {},
                            ),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                          launch("tel://0913 915 358");
                        },
                        child: Text(
                          "Hotline: 0913 915 358",
                          style: AppStyle.DEFAULT_SMALL.copyWith(),
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Cơ sở Hồ Chí Minh",
                style: AppStyle.DEFAULT_SMALL_BOLD.copyWith(),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.email_outlined,
                        size: 15,
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      flex: 14,
                      child: GestureDetector(
                        onTap: () {

                          Clipboard.setData(new ClipboardData(text: "clbdoanhnhantrehcm@gmail.com"));
                          final snackBar = SnackBar(
                            content: Text('Đã copy'),
                            backgroundColor: Colors.blue,
                            duration: Duration(seconds: 1),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {},
                            ),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        },
                        child: Text(
                          "Email: clbdoanhnhantrehcm@gmail.com",
                          style: AppStyle.DEFAULT_SMALL.copyWith(),
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                        ),
                      )),
                ],
              ),
            ],
          )),
    );
  }

  _buildContact() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Theo dõi chúng tôi",
              style: AppStyle.DEFAULT_SMALL_BOLD.copyWith(),
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: null,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Image.asset(
                        "assets/images/facebook_square.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      flex: 14,
                      child: Text(
                        "Facebook",
                        style: AppStyle.DEFAULT_SMALL.copyWith(),
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: null,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Image.asset(
                        "assets/images/youtube-rounded-square-logo.png",
                        color: Colors.black,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      flex: 14,
                      child: Text(
                        "Youtube",
                        style: AppStyle.DEFAULT_SMALL.copyWith(),
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
