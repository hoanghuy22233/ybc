import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_state.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/gender/bloc/gender_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/gender/bloc/gender_state.dart';
import 'package:ybc/utils/dio/dio_status.dart';
import 'package:ybc/utils/handler/http_handler.dart';

import 'bloc/gender_event.dart';

class WidgetGender extends StatefulWidget {
  final int title;

  const WidgetGender({Key key, this.title}) : super(key: key);
  @override
  _WidgetGenderState createState() => _WidgetGenderState();
}

class _WidgetGenderState extends State<WidgetGender> {
  List<Gender> _companies = Gender.getGender();
  List<DropdownMenuItem<Gender>> _dropdownMenuItems;
  Gender _selectedCompany;
  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    if (widget.title != 0 && widget.title != null && widget.title > 0) {
      _selectedCompany = _dropdownMenuItems[widget.title - 1].value;
    } else {
      _selectedCompany = _dropdownMenuItems[0].value;
    }
  }

  List<DropdownMenuItem<Gender>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Gender>> items = List();
    for (Gender company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Gender selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
    BlocProvider.of<GenderBloc>(context)
        .add(GenderSubmitted(_selectedCompany.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, ProfileState) {
        if (ProfileState is ProfileLoaded) {
          return BlocListener<GenderBloc, GenderState>(
            listener: (context, state) async {
              if (state.status != null) {
                if (state.status.code == DioStatus.API_PROGRESS_NOTIFY) {
                  await HttpHandler.resolve(status: state.status);
                }
                if (state.status.code == DioStatus.API_SUCCESS) {
                  BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
                  await HttpHandler.resolve(status: state.status);
                }
                if (state.status.code == DioStatus.API_FAILURE_NOTIFY) {
                  await HttpHandler.resolve(status: state.status);
                }
              }
            },
            child: DropdownButton(
              value: _selectedCompany,
              items: _dropdownMenuItems,
              onChanged: onChangeDropdownItem,
            ),
          );
        } else {
          return WidgetSpacer();
        }
      },
    );
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
