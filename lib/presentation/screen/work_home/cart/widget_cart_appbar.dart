import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_bloc.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_state.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_appbar_not_search.dart';

class WidgetCartAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return _buildContent(context, state);
    });
  }

  Widget _buildContent(BuildContext context, CartState state) {
    if (state?.carts?.length != null) {
      return _buildAppbar('Giỏ hàng (${state?.carts?.length ?? '0'})');
    } else {
      return Center(
          child: Container(
        height: 100,
        width: 100,
        child: Lottie.asset(
          'assets/lottie/trail_loading.json',
        ),
      ));
    }
  }

  Widget _buildAppbar(String title) => WidgetAppbarNotSearch(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        left: [
          WidgetAppbarMenuBack(),
        ],
        title: title,
      );
}
