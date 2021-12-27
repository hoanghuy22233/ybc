import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/entity_offline/work/planItem.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/screen/login/widget_login_form.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_appbar_not_search.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_appbar_with_search.dart';
import 'package:ybc/presentation/screen/work_home/menu/plan_business/create_sample_plan_business_one/widget_sample_plan_business_form.dart';
import 'package:ybc/presentation/screen/work_home/menu/plan_business/widget_button.dart';
import 'package:ybc/utils/locale/app_localization.dart';

class CreateSamplePlanScreen extends StatefulWidget {

  @override
  _CreateSamplePlanScreenState createState() => _CreateSamplePlanScreenState();
}

class _CreateSamplePlanScreenState extends State<CreateSamplePlanScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

  }
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200]
        ),
        child: Column(
          children: [
            _buildAppbar("Tạo mẫu kế hoạch kinh doanh"),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(AppLocalizations.of(context).translate('introduce'), style: AppStyle.DEFAULT_MEDIUM_BOLD,),
                      ),
                      _buildForm()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
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

  _buildForm() => WidgetSamplePlanForm();
}
