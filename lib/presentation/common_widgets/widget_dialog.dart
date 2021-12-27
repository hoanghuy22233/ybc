import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';

class WidgetDialog extends StatelessWidget {
  final String title;
  final String content;
  final String image;
  final String titleAction1;
  final Function action1;
  final Color colorButton1;
  final String titleAction2;
  final Function action2;
  final Color colorButton2;

  const WidgetDialog({Key key, this.title, this.content, this.image = 'assets/icons/warning.png', this.action1, this.action2, this.titleAction1, this.titleAction2, this.colorButton1 = Colors.blue, this.colorButton2 = Colors.blue}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(title, style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: Colors.red, fontSize: 16),),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 60,
                width: 60,
                child: GestureDetector(
                  onTap: (){

                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(image),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(content, style: AppStyle.DEFAULT_SMALL_BOLD.copyWith(color: Colors.black,), textAlign: TextAlign.center,)
            ),
          ],
        ),
      ),
      actions: [
        RaisedButton(
            child: Text(titleAction1),
            color: colorButton1,
            onPressed: (){
              action1();
            }
        ),
        titleAction2 != null ? RaisedButton(
            child: Text(titleAction2),
            color: colorButton2,
            onPressed: (){
              action2();
            }
        ) : Container(),
      ],
    );
  }
}
