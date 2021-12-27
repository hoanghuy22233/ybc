import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';

class WidgetSnackBarNotify extends StatelessWidget {
  final String message;
  final String positiveLabel;
  final Function onPositiveTap;
  final String negativeLabel;
  final Function onNegativeTap;
  final bool onTouchOutsizeEnable;

  const WidgetSnackBarNotify(
      {Key key,
      @required this.message,
      @required this.positiveLabel,
      this.onPositiveTap,
      @required this.negativeLabel,
      this.onNegativeTap,
      this.onTouchOutsizeEnable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned.fill(
                child: GestureDetector(
              onTap: onTouchOutsizeEnable ? onNegativeTap : null,
              child: Container(
                color: Colors.transparent,
              ),
            )),
            Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: new BoxConstraints(
//                  minHeight: MediaQuery.of(context).size.height * .5,
                  minWidth: MediaQuery.of(context).size.width * .9,
                  maxHeight: MediaQuery.of(context).size.height * .5,
                  maxWidth: MediaQuery.of(context).size.width * .9,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.WHITE,
                      borderRadius: BorderRadius.circular(20.0)),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildLogo(),
                                WidgetSpacer(
                                  height: 10,
                                ),
                                Text(
                                  message,
                                  style: AppStyle.DEFAULT_MEDIUM,
                                  textAlign: TextAlign.center,
                                ),
                                WidgetSpacer(
                                  height: 10,
                                ),
                                FractionallySizedBox(
                                  child: FlatButton(
                                    onPressed: onPositiveTap,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Text(
                                      positiveLabel,
                                      style: AppStyle.DEFAULT_MEDIUM
                                          .copyWith(color: AppColor.WHITE),
                                    ),
                                    color: Colors.blue, //AppColor.THIRD_COLOR,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(500.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: onNegativeTap,
                        child: Text(
                          negativeLabel,
                          style: AppStyle.DEFAULT_MEDIUM.copyWith(
                              color: AppColor.SECONDARY_COLOR,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  _buildLogo() => WidgetLogo(
        widthPercent: 0.6,
      );
}
