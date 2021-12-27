import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/presentation/screen/work_home/cart/widget_cart_appbar.dart';
import 'package:ybc/presentation/screen/work_home/cart/widget_cart_menu.dart';
import 'package:ybc/presentation/screen/work_home/cart/widget_cart_product.dart';

import 'bloc/bloc.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  PanelController _panelController = new PanelController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CartBloc>(context).add(LoadCart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
        child: Column(
            children: [
              _buildAppbar(),
              Expanded(
                child: RefreshIndicator(
                    onRefresh: () async {
                      BlocProvider.of<CartBloc>(context).add(RefreshCart());
                      await Future.delayed(Duration(seconds: 2));
                      return true;
                    },
                    color: AppColor.PRIMARY_COLOR,
                    backgroundColor: AppColor.WORK_COLOR,
                    child: _buildCart()),
              ),
              WidgetCartMenu()
        ]
      )
    );
  }

  Widget _buildCart() => WidgetCartProduct();
  Widget _buildAppbar() => WidgetCartAppbar();
}
