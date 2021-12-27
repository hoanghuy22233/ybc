import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/app/constants/string/validator.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/common_widgets/widget_login_button.dart';
import 'package:ybc/presentation/common_widgets/widget_login_input.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_appbar_not_search.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/update_information_bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/widget_profile_detail_image.dart';
import 'package:ybc/presentation/screen/work_home/payments/sc_payments.dart';
import 'package:ybc/utils/locale/app_localization.dart';
import 'package:ybc/model/entity_offline/work/appointmentItem.dart';

class BookAppointmentForm extends StatefulWidget {
  @override
  _BookAppointmentFormState createState() =>
      _BookAppointmentFormState();
}

class _BookAppointmentFormState extends State<BookAppointmentForm> {
  List<AppointmentItem> selectAppointments;
  AppointmentItem selectedAppointment;
  int selectedRadio;
  int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 1;
    selectAppointments = AppointmentItem.getItem();
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }
  setSelectedAppointment(AppointmentItem appointmentItem) {
    setState(() {
      selectedAppointment = appointmentItem;
    });
  }

  List<Widget> createRadioListAppoint() {
    List<Widget> widgets = [];
    for (AppointmentItem appointment in selectAppointments) {
      widgets.add(
        RadioListTile(
          value: appointment,
          groupValue: selectedAppointment,
          title: Text(appointment.name),
          subtitle: Text(AppValue.APP_MONEY_FORMAT.format(appointment.price)),
          onChanged: (currentAppointment) {
            print("Current User ${currentAppointment.id}");
            setSelectedAppointment(currentAppointment);
          },
          selected: selectedAppointment == appointment,
          activeColor: Colors.blue,
        ),
      );
    }
    return widgets;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.green, spreadRadius: 1),
            ],
          ),
          child: Column(
            children: createRadioListAppoint(),
          ),
        ),
        SizedBox(height: 20,),
        _buildButtonPay()
      ],
    );
  }

  // _buildButtonRate() {
  //   return WidgetLoginButton(
  //     onTap: () {
  //       print('sao: $star');
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             scrollable: true,
  //             title: Text('Cảm ơn bạn đã đánh giá!', style: AppStyle.DEFAULT_MEDIUM_BOLD,),
  //             content: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Center(
  //                 child: Container(
  //                   height: 60,
  //                   width: 60,
  //                   child: GestureDetector(
  //                     onTap: (){
  //
  //                     },
  //                     child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(100),
  //                       child: Image.asset('assets/images/happy.png'),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             actions: [
  //               RaisedButton(
  //                   child: Text("Trở về"),
  //                   color: Colors.blue,
  //                   onPressed: (){
  //                     AppNavigator.navigateBack();
  //                     AppNavigator.navigateBack();
  //                     AppNavigator.navigateBack();
  //                   }
  //               )
  //             ],
  //           );
  //         }
  //       );
  //     },
  //     isEnable: false,
  //     height: 45,
  //     backgroundColor: Colors.blue,
  //     text: AppLocalizations.of(context).translate('rate_user.title'),
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
  }

  _buildButtonPay() {
    return WidgetLoginButton(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentsScreen()),
        );
      },
      height: 50,
      backgroundColor: Colors.blue,
      isEnable: false,
      text: AppLocalizations.of(context).translate('book_appointment.pay'),
    );
  }
}

