import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';

class WidgetResend extends StatelessWidget {
  final Function onTap;
  final int time;
  final bool isValid;

  const WidgetResend({Key key, this.onTap, this.time, this.isValid}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    String tmpTime = '';
    if (time < 10) {
      tmpTime = '00:0${time}';
    } else {
      tmpTime = '00:${time}';
    }
    return Container(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context).translate('forgot_password_verify.no_code'),
            style: AppStyle.DEFAULT_MEDIUM,
          ),
          WidgetSpacer(
            width: 5,
          ),
          WidgetLink(
            text: !isValid
                ? '${AppLocalizations.of(context).translate('forgot_password_verify.resend')} ($tmpTime)'
                : '${AppLocalizations.of(context).translate('forgot_password_verify.resend')}',
            style: !isValid
                ? AppStyle.APP_MEDIUM_BOLD.copyWith(
              color: AppColor.GREY,
              decoration: TextDecoration.underline,
            )
                : AppStyle.APP_MEDIUM_BOLD.copyWith(
              color: AppColor.BLACK,
              decoration: TextDecoration.underline,
            ),
            onTap: !isValid ? null : onTap,
          )
        ],
      ),
    );
  }
}
