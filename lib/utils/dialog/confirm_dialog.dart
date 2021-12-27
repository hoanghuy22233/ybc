import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:flutter/material.dart';

class ConfirmDialog {
  static show(BuildContext context, String title,
      {String ok = "Đồng ý", String cancel = "Huỷ"}) async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: GestureDetector(
                    onTap: () {},
                    child: Center(
                        child: Container(
                      height: 110,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "$title",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () => Navigator.pop(context, true),
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Text(
                                    "$ok",
                                    style: AppStyle.DEFAULT_MEDIUM,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pop(context, false),
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Text(
                                    "$cancel",
                                    style: AppStyle.DEFAULT_MEDIUM,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ))),
              ));
        });
  }
}
