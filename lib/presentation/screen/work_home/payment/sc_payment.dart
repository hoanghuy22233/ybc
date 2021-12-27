import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/common_widgets/widget_touch_hide_keyboard.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_bloc.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_appbar_not_search.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_state.dart';
import 'package:ybc/presentation/screen/work_home/payment/payment_form/bloc/payment_form_bloc.dart';
import 'package:ybc/presentation/screen/work_home/payment/payment_form/bloc/payment_form_event.dart';
import 'package:ybc/presentation/screen/work_home/payment/payment_form/widget_payment_form.dart';
import 'package:ybc/presentation/screen/work_home/payment/widget_payment_cart.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PanelController _panelController = new PanelController();

  _onArgument() {
    Future.delayed(Duration.zero, () async {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      BlocProvider.of<PaymentFormBloc>(context).add(InitPaymentForm());
      BlocProvider.of<PaymentFormBloc>(context)
          .add(CartLoaded(BlocProvider.of<CartBloc>(context).state.carts));
      var profileState = BlocProvider.of<ProfileBloc>(context).state;
      if (profileState is ProfileLoaded) {}
    });
  }

  @override
  void initState() {
    super.initState();
    _onArgument();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetTouchHideKeyBoard(
      child: Scaffold(
        body: SafeArea(
          top: true,
          child: Container(
            color: Colors.white,
            child: _buildContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
        child: Column(children: [
          _buildAppbar("Thanh toán"),
          Expanded(
              child: RefreshIndicator(
                  onRefresh: () async {
    //                  BlocProvider.of<PaymentBloc>(context).add(RefreshPayment());
                    await Future.delayed(AppValue.FAKE_TIME_RELOAD);
                    return true;
                  },
                  color: AppColor.PRIMARY_COLOR,
                  backgroundColor: AppColor.THIRD_COLOR,
                  child: SingleChildScrollView(
                      child: Container(
                        color: AppColor.GREY_LIGHTER_3,
                        child: _buildCart(),
                      )
                  )
              )
          ),
          _buildForm()
        ]
      )
    );
  }

  Widget _buildAppbar(String title) => WidgetAppbarNotSearch(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        left: [
          WidgetAppbarMenuBack(),
        ],
        title: title,
      );

  Widget _buildCart() => WidgetPaymentCart();

  Widget _buildForm() => WidgetPaymentForm();

//  Widget _buildForm() => WidgetPay();
//
//  Widget _buildSaleCode() => WidgetPaymentCode(
//        onChevronRightTap: () {
//          _panelController.isPanelOpen
//              ? _panelController.close()
//              : _panelController.open();
//        },
//      );
}
