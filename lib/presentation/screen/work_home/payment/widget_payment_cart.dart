import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/presentation/common_widgets/widget_circle_progress.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_bloc.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_state.dart';
import 'package:ybc/presentation/screen/work_home/payment/widget_payment_cart_item.dart';

class WidgetPaymentCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return _buildContent(state);
      },
    );
  }

  Widget _buildContent(CartState state) {
    if (state.carts != null) {
      return Container(
        padding: EdgeInsets.all(8.0),
        color: AppColor.WHITE,
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return WidgetPaymentCartItem(
              cart: state.carts[index],
            );
          },
          itemCount: state.carts.length,
          separatorBuilder: (context, index) {
            return WidgetSpacer(height: 20);
          },
          physics: ScrollPhysics(),
        ),
      );
    } else {
      return Center(child: WidgetCircleProgress());
    }
  }
}
