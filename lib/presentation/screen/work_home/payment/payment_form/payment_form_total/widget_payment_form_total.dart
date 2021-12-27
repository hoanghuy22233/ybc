import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/app/constants/value/value.dart';
import 'package:ybc/presentation/common_widgets/widget_dialog.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_state.dart';
import 'package:ybc/presentation/screen/work_home/payment/payment_form/bloc/payment_form_bloc.dart';
import 'package:ybc/presentation/screen/work_home/payment/payment_form/bloc/payment_form_event.dart';
import 'package:ybc/presentation/screen/work_home/payment/payment_form/bloc/payment_form_state.dart';
import 'package:ybc/utils/dialog/get_dialog_utils.dart';
import 'package:ybc/utils/snackbar/get_snack_bar_utils.dart';

class WidgetPaymentFormTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: BlocBuilder<PaymentFormBloc, PaymentFormState>(
      builder: (context, state) {
        return _buildContent(context, state);
      },
    ));
  }

  Widget _buildContent(BuildContext context, PaymentFormState state) {
    return Column(
      children: [
        WidgetSpacer(
          height: 10,
        ),
        Divider(
          height: 0,
          thickness: 0.3,
          color: AppColor.BLACK,
        ),
        WidgetSpacer(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                "Tổng thanh toán".toUpperCase(),
                style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(
                  color: AppColor.THIRD_COLOR,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: Text(
                '${AppValue.APP_MONEY_FORMAT.format(state.getTotalInvoice())}'
                    .toUpperCase(),
                style: AppStyle.DEFAULT_MEDIUM_BOLD
                    .copyWith(color: Color(0xFF940404)),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        WidgetSpacer(
          height: 10,
        ),
        BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          if (state is ProfileLoaded) {
            return _buildContents(context, state);
          } else if (state is ProfileLoading) {
            return Center(
              child: Container(
                height: 100,
                width: 100,
                child: Lottie.asset(
                  'assets/lottie/trail_loading.json',
                ),
              ),
            );
          } else if (state is ProfileNotLoaded) {
            return Center(
              child: Text('${state.error}'),
            );
          } else {
            return Center(
              child: Text('Unknown state'),
            );
          }
        }),
        // Container(
        //   width: double.infinity,
        //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        //   child: FlatButton(
        //     onPressed: () {
        //       BlocProvider.of<PaymentFormBloc>(context)
        //           .add(PaymentFormSubmitted());
        //     }
        // ,
        //     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        //     child: Text(
        //       "Thanh toán",
        //       style: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.WHITE),
        //     ),
        //     color: AppColor.THIRD_COLOR,
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(500.0)),
        //   ),
        // ),
      ],
    );
  }

  _buildContents(BuildContext context, ProfileLoaded state) {
    return BlocListener<PaymentFormBloc, PaymentFormState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }
        if (state.isSuccess) {
          GetSnackBarUtils.createSuccess(message: state.status.message);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return WidgetDialog(
                  title: 'Thanh toán',
                  image: 'assets/images/ybc.png',
                  content: "Bạn vui lòng thanh toán bằng phương thức chuyển khoản!\nNgân hàng: Vietcombank \nChi nhánh: Hà Nội \nSTK: 00310005739.",
                  action1: (){
                    AppNavigator.navigateWorkService();
                    AppNavigator.navigateHistoryOrder();
                  },
                  colorButton1: Colors.blue,
                  titleAction1: 'Đến đơn hàng',

                  action2: (){
                    AppNavigator.navigateWorkService();
                  },
                  colorButton2: Colors.blue,
                  titleAction2: 'Về trang chủ',
                );
              });
        }
        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.status.message);
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: FlatButton(
          onPressed: () {
            if (state?.user?.email != null &&
                state?.user?.tel != null &&
                state?.user?.address != null) {
              BlocProvider.of<PaymentFormBloc>(context).add(PaymentFormSubmitted(
                  name: state?.user?.name ?? '',
                  email: state?.user?.email ?? '',
                  address: state?.user?.address ?? 'Hải phòng',
                  cityId: 1,
                  districtId: 1,
                  wardId: 1,
                  tel: state?.user?.tel ?? '012345678',
                  paymentType: 1,
                  token: state?.user?.apiToken ?? ''));


              // GetDialogUtils.createNotify(
              //     message:
              //         "Bạn vui lòng thanh toán bằng phương thức chuyển khoản: \nNgân hàng: Vietcombank \nChi nhánh: Hà Nội \nSTK: 00310005739.",
              //     positiveLabel: "Đồng ý ",
              //      //negativeLabel: "Bỏ qua",
              //     onPositiveTap: () {
              //       AppNavigator.navigateHistoryOrder();
              //     });
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return WidgetDialog(
                      title: 'Thông báo',
                      image: 'assets/images/ybc.png',
                      content: "Vui lòng vào trang tài khoản để cập nhật thông tin!",
                      action1: (){
                        AppNavigator.navigateBack();
                        AppNavigator.navigateChangeProfile();
                      },
                      colorButton1: Colors.blue,
                      titleAction1: 'Cập nhật',

                      action2: (){
                        AppNavigator.navigateBack();
                      },
                      colorButton2: Colors.grey[200],
                      titleAction2: 'Trở về',
                    );
                  });
            }
          },
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            "Thanh toán",
            style: AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.WHITE),
          ),
          color: AppColor.WORK_COLOR,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(500.0)),
        ),
      ),
    );
  }
}
