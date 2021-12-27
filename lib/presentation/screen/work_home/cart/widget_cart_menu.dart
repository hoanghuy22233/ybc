import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_bloc.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_state.dart';
import 'package:ybc/utils/utils.dart';

class WidgetCartMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return _buildContent(context, state);
    });
  }

  Widget _buildContent(BuildContext context, CartState state) {
    if (state?.carts != null) {
      return state.carts.length > 0 ? Container(
        height: AppValue.ACTION_BAR_HEIGHT,
        child: Column(
          children: [
            Divider(
              height: 1,
              thickness: 0.5,
              color: AppColor.GREY,
            ),
            Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                              text: AppLocalizations.of(context)
                                  .translate('cart.menu_total')
                                  .toUpperCase(),
                              style: AppStyle.DEFAULT_MEDIUM,
                              children: [
                                TextSpan(
                                  text: AppValue.APP_MONEY_FORMAT.format(
                                      state?.carts?.length != null
                                          ? state.getTotalInvoice()
                                          : "0đ"),
                                  style: AppStyle.DEFAULT_MEDIUM
                                      .copyWith(color: AppColor.RED),
                                )
                              ]),
                        ),
                        color: AppColor.WHITE,
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          AppNavigator.navigatePayment();
                        },
                        child: Container(
                          height: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)
                                .translate('cart.menu_order_now')
                                .toUpperCase(),
                            style: AppStyle.DEFAULT_MEDIUM
                                .copyWith(color: AppColor.WHITE),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                          color: AppColor.WORK_COLOR,
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ): Container(
          height: MediaQuery.of(context).size.height*0.85,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 120,
                  width: 120,
                  child: Image.asset('assets/images/box.png')
              ),
              SizedBox(height: 20,),
              Text('Giỏ hàng trống!'),
            ],
          ),
      );
    } else {
      return Center(child: WidgetCircleProgress());
    }
  }
}
