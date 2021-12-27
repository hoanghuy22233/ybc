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
import 'package:ybc/utils/locale/app_localization.dart';
import 'package:ybc/utils/snackbar/get_snack_bar_utils.dart';

class WidgetRateUserForm extends StatefulWidget {
  final String image;
  final String fullName;

  const WidgetRateUserForm({Key key, this.image, this.fullName}) : super(key: key);
  @override
  _WidgetRateUserFormState createState() =>
      _WidgetRateUserFormState();
}

class _WidgetRateUserFormState
    extends State<WidgetRateUserForm> {

  final TextEditingController _rateContentController = TextEditingController();
  bool autoValidate = false;
  bool checkedValue = false;
  String name='';
  double star;

  bool get isPopulated =>
      _rateContentController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    star = 5.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 90, left: 15, right: 15),
      //      margin: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfo(),
            WidgetSpacer(
              height: 10,
            ),
            Center(
              child: SmoothStarRating(
                  allowHalfRating: false,
                  onRated: (v) {
                    star = v;
                  },
                  starCount: 5,
                  rating: 5,
                  size: 30.0,
                  color: Colors.amber,
                  borderColor: Colors.amber,
                  spacing:0.0
              ),
            ),
            WidgetSpacer(
              height: 20,
            ),
            _buildTextFieldRateContent(),

            CheckboxListTile(
              title: Text("Ẩn danh", style: AppStyle.DEFAULT_MEDIUM,),
              value: checkedValue,
              activeColor: Colors.blue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = !checkedValue;
                  if(!checkedValue){
                    name ='Lê Huy Tùng';
                  }
                  else{
                    name = "L*****g";
                  }
                });
              },
              controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
            ),
            Text("Tên của bạn sẽ được hiển thị: $name", style: AppStyle.DEFAULT_SMALL,),
            WidgetSpacer(
              height: 20,
            ),
            _buildButtonRate()
          ],
        ),
      ),
    );
  }

  // _buildSaveButton(UpdateInformationState state) {
  //   return GestureDetector(
  //     onTap: () {
  //       if (isUpdateInformationBlocButtonEnabled()) {
  //         _updateInformationBloc.add(UpdateInformationSubmitted(
  //             name: _nameController.text.trim(),
  //             dob: DateFormat("yyyy-MM-dd").format(DateFormat("dd-MM-yyyy").parse(_dobController.text.trim())),
  //             tel: _telController.text.trim(),
  //             email: _emailController.text.trim(),
  //             address: _addressController.text.trim(),
  //             job: _jobController.text.trim(),
  //             intro: _introController.text.trim(),
  //             gender: _selectedGender.id));
  //         FocusScope.of(context).unfocus();
  //       }
  //     },
  //     child: Padding(
  //       padding: const EdgeInsets.only(right: 10),
  //       child: Text(
  //         AppLocalizations.of(context).translate('edit_profile.save'),
  //         style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: Colors.white),
  //       ),
  //     ),
  //   );
  // }

  _buildInfo() {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          margin: EdgeInsets.only(top: 5, left: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(widget.image),
          ),
        ),
        SizedBox(width: 10,),
        Text(widget.fullName)
      ],
    );
  }

  _buildButtonRate() {
    return WidgetLoginButton(
      onTap: () {
        print('sao: $star');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              scrollable: true,
              title: Text('Cảm ơn bạn đã đánh giá!', style: AppStyle.DEFAULT_MEDIUM_BOLD,),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    height: 60,
                    width: 60,
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/images/happy.png'),
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                RaisedButton(
                    child: Text("Trở về"),
                    color: Colors.blue,
                    onPressed: (){
                      AppNavigator.navigateBack();
                      AppNavigator.navigateBack();
                      AppNavigator.navigateBack();
                    }
                )
              ],
            );
          }
        );
      },
      isEnable: false,
      height: 45,
      backgroundColor: Colors.blue,
      text: AppLocalizations.of(context).translate('rate_user.title'),
    );
  }

  _buildTextFieldRateContent() {
    return WidgetLoginInput(
      inputController: _rateContentController,
      onChanged: (value) {

      },
      validator: AppValidation.validateAddress(
          AppLocalizations.of(context).translate('rate_user.content')),
      autovalidate: autoValidate,
      hint: AppLocalizations.of(context).translate('rate_user.content'),
      //labelText: AppLocalizations.of(context).translate('edit_profile.intro_hint'),
      maxLine: 10,
      minLine: 2,
      height: MediaQuery.of(context).size.height*0.4,
      // endIcon: GestureDetector(
      //   onTap: (){
      //     this._introController.clear();
      //   },
      //   child: Icon(Icons.highlight_remove,
      //       color: Colors.grey,
      //       size: 20),
      // ),
      // leadIcon: Padding(
      //   padding: const EdgeInsets.only(right: 10),
      //   child: Image.asset("assets/images/information.png", height: 15, width: 15, fit: BoxFit.fill,color: Colors.grey,),
      // ),
    );
  }

  @override
  void dispose() {
    _rateContentController.dispose();
    super.dispose();
  }
}

