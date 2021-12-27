import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_event.dart';
import 'package:ybc/presentation/screen/work_home/payment/payment_form/payment_form_total/widget_payment_form_total.dart';
import 'package:ybc/utils/handler/http_handler.dart';

import 'bloc/bloc.dart';

class WidgetPaymentForm extends StatefulWidget {
  @override
  _WidgetPaymentFormState createState() => _WidgetPaymentFormState();
}

class _WidgetPaymentFormState extends State<WidgetPaymentForm> {
  PaymentFormBloc _paymentFormBloc;

  @override
  void initState() {
    super.initState();
    _paymentFormBloc = BlocProvider.of<PaymentFormBloc>(context);
    BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentFormBloc, PaymentFormState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          print('---isSubmitting---');
          print(state.status);
          await HttpHandler.resolve(status: state.status);
        }

        if (state.isSuccess) {
          print('---isSuccess---');
          print(state.status);
          await HttpHandler.resolve(status: state.status);
        }

        if (state.isFailure) {
          print('---isFailure---');
          print(state.status);
          await HttpHandler.resolve(status: state.status);
        }
      },
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
              color: AppColor.WHITE,
              child: WidgetPaymentFormTotal(),
            ),
          ],
        ),
      ),
    );
  }
}
