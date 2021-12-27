import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/common_widgets/widget_dialog.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/bought_product/plan_business_item.dart';
import 'package:ybc/utils/utils.dart';

class WidgetCartProduct extends StatefulWidget {
  @override
  _WidgetCartProductState createState() => _WidgetCartProductState();
}

class _WidgetCartProductState extends State<WidgetCartProduct> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  _onRefresh() async {}

  _onLoadMore() async {}

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) async {
        if (state.isLoading) {
          await HttpHandler.resolve(status: state.status);
        }

        if (state.isSuccess) {
          await HttpHandler.resolve(status: state.status);
        }

        if (state.isFailure) {
          await HttpHandler.resolve(status: state.status);
        }
      },
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return _buildContent(state);
        },
      ),
    );
  }

  Widget _buildContent(CartState state) {
    if (state.carts != null) {
      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PlanBusinessItem(
                    cartItem: state.carts[index],
                    onDeleteTap: () {
                      // GetDialogUtils.createNotify(
                      //     message: AppLocalizations.of(context)
                      //         .translate('cart.delete_message'),
                      //     positiveLabel: AppLocalizations.of(context)
                      //         .translate('cart.delete_message_positive'),
                      //     negativeLabel: AppLocalizations.of(context)
                      //         .translate('cart.delete_message_negative'),
                      //     onPositiveTap: () {
                      //       BlocProvider.of<CartBloc>(context)
                      //           .add(RemoveCart(state.carts[index].id));
                      //       AppNavigator.navigateBack();
                      //     });
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return WidgetDialog(
                              title: 'Xóa',
                              content: "Xóa sản phẩm?",
                              action1: (){
                                BlocProvider.of<CartBloc>(context)
                                    .add(RemoveCart(state.carts[index].id));
                                AppNavigator.navigateBack();
                              },
                              colorButton1: Colors.red,
                              titleAction1: 'Xóa',

                              action2: (){
                                Navigator.of(context, rootNavigator: true).pop('dialog');
                              },
                              colorButton2: Colors.grey[200],
                              titleAction2: 'Hủy',
                            );
                          });
                    },
                  );
                },
                itemCount: state.carts.length,
                separatorBuilder: (context, index) {
                  return WidgetSpacer(height: 20);
                },
                physics: ScrollPhysics(),
              ),
              WidgetSpacer(
                height: 40,
              )
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Container(
          height: 100,
          width: 100,
          child: Lottie.asset(
            'assets/lottie/trail_loading.json',
          ),
        ),
      );
    }
  }
}
