// import 'package:custom_cupertino_date_textbox/custom_cupertino_date_textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/app/constants/string/validator.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/common_widgets/widget_login_button.dart';
import 'package:ybc/presentation/common_widgets/widget_login_input.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_account/widget_appbar_not_search.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/update_information_bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/widget_profile_detail_image.dart';
import 'package:ybc/utils/locale/app_localization.dart';
import 'package:ybc/utils/snackbar/get_snack_bar_utils.dart';

class WidgetUpdateInformationBlocForm extends StatefulWidget {
  final String image;
  final String name;
  final String gender;
  final String phone;
  final String email;
  final String dob;
  final String address;
  final String job;
  final String intro;

  const WidgetUpdateInformationBlocForm(
      {Key key,
      this.image = '',
      this.name = '',
      this.gender = '0',
      this.phone = '',
      this.email = '',
      this.dob = '',
      this.address = '',
      this.job = '',
      this.intro = ''})
      : super(key: key);
  @override
  _WidgetUpdateInformationBlocFormState createState() =>
      _WidgetUpdateInformationBlocFormState();
}

class _WidgetUpdateInformationBlocFormState
    extends State<WidgetUpdateInformationBlocForm> {
  UpdateInformationBloc _updateInformationBloc;

  List<Gender> _gender = Gender.getGender();
  List<DropdownMenuItem<Gender>> _dropdownMenuItems;
  Gender _selectedGender;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _introController = TextEditingController();

  bool autoValidate = false;

  int gender = 0;

  bool get isPopulated =>
      _nameController.text.isNotEmpty &&
      _dobController.text.isNotEmpty &&
      _addressController.text.isNotEmpty &&
      _telController.text.isNotEmpty &&
      _emailController.text.isNotEmpty &&
      _jobController.text.isNotEmpty &&
      _introController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _updateInformationBloc = BlocProvider.of<UpdateInformationBloc>(context);

    widget.name != null ? _nameController.text = widget.name : '';
    widget.dob != null ? _dobController.text = widget.dob : '';
    widget.address != null ? _addressController.text = widget.address : '';
    widget.phone != null ? _telController.text = widget.phone : '';
    widget.email != null ? _emailController.text = widget.email : '';
    widget.job != null ? _jobController.text = widget.job : '';
    widget.intro != null ? _introController.text = widget.intro : '';

    _nameController.addListener(_onNameChange);
    _dobController.addListener(_onDobChanged);
    _addressController.addListener(_onAddressChanged);
    _telController.addListener(_onTelChanged);
    _emailController.addListener(_onEmailChanged);
    _jobController.addListener(_onJobChanged);
    _introController.addListener(_onIntroChanged);

    _dropdownMenuItems = buildDropdownMenuItems(_gender);
    gender = int.parse(widget.gender);
    _selectedGender = gender != null
        ? _dropdownMenuItems[gender].value
        : _dropdownMenuItems[0].value;
    //_selectedGender= _dropdownMenuItems[2].value;
  }

  List<DropdownMenuItem<Gender>> buildDropdownMenuItems(List genders) {
    List<DropdownMenuItem<Gender>> items = List();
    for (Gender gender in genders) {
      items.add(
        DropdownMenuItem(
          value: gender,
          child: Text(gender.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Gender selectedGender) {
    setState(() {
      _selectedGender = selectedGender;
      print('Dropbox ID: ${_selectedGender.id}');
      gender = _selectedGender.id;
    });
  }

  DateTime _selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateInformationBloc, UpdateInformationState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }

        if (state.isSuccess) {
          await GetSnackBarUtils.createSuccess(message: state.message);
          AppNavigator.navigateBack();
        }

        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
          setState(() {
            autoValidate = true;
          });
        }
      },
      child: BlocBuilder<UpdateInformationBloc, UpdateInformationState>(
        builder: (context, state) {
          return Stack(
            children: [
              _buildAppbar(state),
              Container(
                padding: EdgeInsets.only(top: 60, left: 15, right: 15),
                //      margin: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WidgetSpacer(
                        height: 10,
                      ),
                      WidgetProfileDetailImage(
                        avatarUrl: widget.image,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _buildTextFieldName(),
                      WidgetSpacer(
                        height: 10,
                      ),
                      _buildChooseGender(),

                      WidgetSpacer(
                        height: 10,
                      ),
                      _buildTextFieldTel(),
                      WidgetSpacer(
                        height: 10,
                      ),
                      _buildTextFieldEmail(),
                      WidgetSpacer(
                        height: 10,
                      ),
                      _buildTextFieldDob(),
                      WidgetSpacer(
                        height: 10,
                      ),
                      _buildTextFieldAddress(),
                      WidgetSpacer(
                        height: 10,
                      ),
                      _buildTextFieldJob(),
                      WidgetSpacer(
                        height: 10,
                      ),
                      _buildTextFieldIntro(),
                      WidgetSpacer(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  bool isUpdateInformationBlocButtonEnabled() {
    return _updateInformationBloc.state.isFormValid &&
        isPopulated &&
        !_updateInformationBloc.state.isSubmitting;
  }

  String errorText='';

  _buildSaveButton(UpdateInformationState state) {
    return GestureDetector(
      onTap: () {
        if(isPopulated){
          if (!_updateInformationBloc.state.isNameValid) {
            errorText = errorText + "Sai định dạng tên\n";
          }
          if (gender == 0) {
            errorText = errorText + "Chưa chọn giới tính\n";
          }
          if (!_updateInformationBloc.state.isTelValid) {
            errorText = errorText + "Sai định dạng số điện thoại\n";
          }
          if (!_updateInformationBloc.state.isEmailValid) {
            errorText = errorText + "Sai định dạng email\n";
          }
          if (!_updateInformationBloc.state.isDobValid || _dobController.text.trim().length != 10) {
            errorText = errorText + "Sai định dạng. VD: 20-09-1986\n";
          }

          if(errorText == '') {
            _updateInformationBloc.add(UpdateInformationSubmitted(
                name: _nameController.text.trim(),
                dob: DateFormat("yyyy-MM-dd").format(DateFormat("dd-MM-yyyy").parse(_dobController.text.trim())),
                tel: _telController.text.trim(),
                email: _emailController.text.trim(),
                address: _addressController.text.trim(),
                job: _jobController.text.trim(),
                intro: _introController.text.trim(),
                gender: _selectedGender.id));
          }
          else{
            print('lỗi : $errorText');
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: Text("Lỗi", style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: Colors.red, fontSize: 16),),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: 60,
                              width: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset('assets/icons/warning.png'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(child: Text('$errorText', style: AppStyle.DEFAULT_SMALL_BOLD.copyWith(color: Colors.black), )),
                        ],
                      ),
                    ),
                    actions: [
                      RaisedButton(
                          child: Text("OK"),
                          color: Colors.red,
                          onPressed: (){
                            Navigator.of(context, rootNavigator: true).pop('dialog');
                            setState(() {
                              errorText='';
                            });
                          }
                      ),
                    ],
                  );
                });
          }

          FocusScope.of(context).unfocus();
        }
        else{
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  title: Text("Thiếu thông tin", style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: Colors.red, fontSize: 16),),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 60,
                            width: 60,
                            child: GestureDetector(
                              onTap: (){

                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset('assets/icons/warning.png'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(child: Text("Bạn chưa nhập đầy đủ thông tin!", style: AppStyle.DEFAULT_SMALL_BOLD.copyWith(color: Colors.black), )),
                      ],
                    ),
                  ),
                  actions: [
                    RaisedButton(
                        child: Text("OK"),
                        color: Colors.red,
                        onPressed: (){
                          Navigator.of(context, rootNavigator: true).pop('dialog');
                        }
                    ),
                  ],
                );
              });
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Text(
          AppLocalizations.of(context).translate('edit_profile.save'),
          style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  _buildAppbar(UpdateInformationState state) => WidgetAppbarNotSearch(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        title: AppLocalizations.of(context).translate('edit_profile.title'),
        left: [WidgetAppbarMenuBack()],
        right: [_buildSaveButton(state)],
      );

  _buildTextFieldName() {
    return WidgetLoginInput(
      inputType: TextInputType.name,
      autovalidate: autoValidate,
      onChanged: (value) {
        _updateInformationBloc.add(NameChanged(name: value));
      },
      hint: AppLocalizations.of(context).translate('edit_profile.fullname_hint'),
      //labelText: AppLocalizations.of(context).translate('edit_profile.fullname'),
      inputController: _nameController,
      validator: (_){
        return !_updateInformationBloc.state.isNameValid ? AppValidation.validateFullName(
        AppLocalizations.of(context).translate('edit_profile.fullname')) : null;
      },
      endIcon: GestureDetector(
        onTap: () {
          this._nameController.clear();
        },
        child: Icon(Icons.highlight_remove, color: Colors.grey, size: 20),
      ),
      // leadIcon: Padding(
      //   padding: const EdgeInsets.only(right: 10),
      //   child: Image.asset("assets/images/ic_user.png", height: 15, width: 15, fit: BoxFit.fill,color: Colors.grey,),
      // ),
    );
  }

  _buildTextFieldTel() {
    return WidgetLoginInput(
      inputType: TextInputType.phone,
      inputController: _telController,
      onChanged: (value) {
        _updateInformationBloc.add(TelChanged(tel: value));
      },
      validator: (_){
        return !_updateInformationBloc.state.isNameValid ? AppValidation.validatePhoneNumber(
            AppLocalizations.of(context).translate('edit_profile.phone_validator')) : null;
      },
      autovalidate: autoValidate,
      hint: AppLocalizations.of(context).translate('edit_profile.phone'),
      //labelText: AppLocalizations.of(context).translate('edit_profile.phone_hint'),
      endIcon: GestureDetector(
        onTap: () {
          this._telController.clear();
        },
        child: Icon(Icons.highlight_remove, color: Colors.grey, size: 20),
      ),
      // leadIcon: Padding(
      //   padding: const EdgeInsets.only(right: 10),
      //   child: Image.asset("assets/images/ic_phone.png", height: 15, width: 15, fit: BoxFit.fill,color: Colors.grey,),),
    );
  }

  _buildTextFieldEmail() {
    return WidgetLoginInput(
      inputType: TextInputType.emailAddress,
      inputController: _emailController,
      onChanged: (value) {
        _updateInformationBloc.add(EmailChanged(email: value));
      },
      validator: AppValidation.validateEmail(
          AppLocalizations.of(context).translate('edit_profile.email_validator')),
      autovalidate: autoValidate,
      hint: AppLocalizations.of(context).translate('edit_profile.email'),
      //labelText: AppLocalizations.of(context).translate('redit_profile.email_hint'),
      endIcon: GestureDetector(
        onTap: () {
          this._emailController.clear();
        },
        child: Icon(Icons.highlight_remove, color: Colors.grey, size: 20),
      ),
      // leadIcon: Padding(
      //   padding: const EdgeInsets.only(right: 10),
      //   child: Image.asset("assets/images/ic_email.png", height: 15, width: 15, fit: BoxFit.fill,color: Colors.grey,),
      // ),
    );
  }

  _buildTextFieldDob() {
    return WidgetLoginInput(
      inputController: _dobController,
      onChanged: (value) {
        _updateInformationBloc.add(DobChanged(dob: value));
      },
      validator: AppValidation.validateFullName(
          AppLocalizations.of(context).translate('edit_profile.birthday_validator')),
      autovalidate: autoValidate,
      hint: AppLocalizations.of(context).translate('edit_profile.birthday_hint'),
      //labelText: AppLocalizations.of(context).translate('edit_profile.birthday_hint'),
      endIcon: GestureDetector(
        onTap: () {
          this._dobController.clear();
        },
        child: Icon(Icons.highlight_remove, color: Colors.grey, size: 20),
      ),
      // leadIcon: Padding(
      //   padding: const EdgeInsets.only(right: 10),
      //   child: Image.asset("assets/images/birthday-cake.png", height: 15, width: 15, fit: BoxFit.fill,color: Colors.grey,),
      // ),
    );
  }

  _buildTextFieldAddress() {
    return WidgetLoginInput(
      inputController: _addressController,
      onChanged: (value) {
        _updateInformationBloc.add(AddressChanged(address: value));
      },
      validator: AppValidation.validateAddress(
          AppLocalizations.of(context).translate('edit_profile.address_hint')),
      autovalidate: autoValidate,
      hint: AppLocalizations.of(context).translate('edit_profile.address'),
      //labelText: AppLocalizations.of(context).translate('edit_profile.address_hint'),
      endIcon: GestureDetector(
        onTap: () {
          this._addressController.clear();
        },
        child: Icon(Icons.highlight_remove, color: Colors.grey, size: 20),
      ),
      // leadIcon: Padding(
      //   padding: const EdgeInsets.only(right: 10),
      //   child: Image.asset("assets/images/address.png", height: 15, width: 15, fit: BoxFit.fill,color: Colors.grey,),
      // ),
    );
  }

  _buildTextFieldJob() {
    return WidgetLoginInput(
      inputController: _jobController,
      onChanged: (value) {
        _updateInformationBloc.add(JobChanged(job: value));
      },
      validator: AppValidation.validateFullName(
          AppLocalizations.of(context).translate('edit_profile.job_hint')),
      autovalidate: autoValidate,
      hint: AppLocalizations.of(context).translate('edit_profile.job'),
      //labelText: AppLocalizations.of(context).translate('edit_profile.job_hint'),
      endIcon: GestureDetector(
        onTap: () {
          this._jobController.clear();
        },
        child: Icon(Icons.highlight_remove, color: Colors.grey, size: 20),
      ),
      // leadIcon: Padding(
      //   padding: const EdgeInsets.only(right: 10),
      //   child: Image.asset("assets/images/job.png", height: 15, width: 15, fit: BoxFit.fill,color: Colors.grey,),
      // ),
    );
  }

  _buildTextFieldIntro() {
    return WidgetLoginInput(
      inputController: _introController,
      onChanged: (value) {
        _updateInformationBloc.add(IntroChanged(intro: value));
      },
      validator: AppValidation.validateAddress(
          AppLocalizations.of(context).translate('edit_profile.intro_hint')),
      autovalidate: autoValidate,
      hint: AppLocalizations.of(context).translate('edit_profile.intro'),
      //labelText: AppLocalizations.of(context).translate('edit_profile.intro_hint'),
      maxLine: 5,
      //minLine: 1,
      height: 150,
      endIcon: GestureDetector(
        onTap: (){
          this._introController.clear();
        },
        child: Icon(Icons.highlight_remove,
            color: Colors.grey,
            size: 20),
      ),
      // leadIcon: Padding(
      //   padding: const EdgeInsets.only(right: 10),
      //   child: Image.asset("assets/images/information.png", height: 15, width: 15, fit: BoxFit.fill,color: Colors.grey,),
      // ),
    );
  }

  _buildChooseGender() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: DropdownButton(
        value: _selectedGender,
        items: _dropdownMenuItems,
        onChanged: onChangeDropdownItem,
        elevation: 5,
        //isExpanded: true,
        style: TextStyle(color: Colors.black, fontSize: 14.0),
      ),
    );
  }

  void _onNameChange() {
    _updateInformationBloc.add(NameChanged(
      name: _nameController.text,
    ));
  }

  void _onDobChanged() {
    _updateInformationBloc.add(DobChanged(dob: _dobController.text));
  }

  void _onAddressChanged() {
    _updateInformationBloc
        .add(AddressChanged(address: _addressController.text));
  }

  void _onTelChanged() {
    _updateInformationBloc.add(TelChanged(tel: _telController.text));
  }

  void _onEmailChanged() {
    _updateInformationBloc.add(EmailChanged(email: _emailController.text));
  }

  void _onJobChanged() {
    _updateInformationBloc.add(JobChanged(job: _jobController.text));
  }

  void _onIntroChanged() {
    _updateInformationBloc.add(IntroChanged(intro: _introController.text));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    _addressController.dispose();
    _telController.dispose();
    _emailController.dispose();
    _jobController.dispose();
    _introController.dispose();
    super.dispose();
  }
  
}

class Gender {
  int id;
  String name;

  Gender(this.id, this.name);

  static List<Gender> getGender() {
    return <Gender>[
      Gender(0, 'Chọn giới tính'),
      Gender(1, 'Nam'),
      Gender(2, 'Nữ'),
      Gender(3, 'Khác'),
    ];
  }
}
