import 'package:flutter/material.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/model/entity_offline/bank_name.dart';

class WidgetBankItem extends StatelessWidget {
  final int bank;
  final Function onTap;

  const WidgetBankItem({Key key, @required this.bank, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      allBank[bank].image,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(
                      allBank[bank].name,
                      style: AppStyle.DEFAULT_MEDIUM,
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Divider(
                  color: AppColor.GREY,
                  height: 1,
                  thickness: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
