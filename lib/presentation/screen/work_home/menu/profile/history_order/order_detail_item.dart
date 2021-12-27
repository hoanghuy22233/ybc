import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/color/color.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/model/entity/order_item.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/common_widgets/widget_touch_hide_keyboard.dart';
import 'package:ybc/presentation/screen/register/widget_register_form.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_account/widget_appbar_not_search.dart';
import 'package:ybc/utils/locale/app_localization.dart';

import 'bloc/bloc.dart';

class OrderDetailItemScreen extends StatefulWidget {
  final OrderItem orderItem;

  const OrderDetailItemScreen({Key key, this.orderItem}) : super(key: key);
  @override
  _OrderDetailItemScreenState createState() => _OrderDetailItemScreenState();
}

class _OrderDetailItemScreenState extends State<OrderDetailItemScreen> {
  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    return WidgetTouchHideKeyBoard(
      child: Scaffold(
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              _buildAppbar(AppLocalizations.of(context).translate('order_detail.title')),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: _buildContent(widget.orderItem),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildContent(OrderItem orderItem) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.4,
          width: MediaQuery.of(context).size.width,

          child: CachedNetworkImage(
            imageUrl: orderItem.image ??
                'https://picsum.photos/250?image=9',
            fit: BoxFit.fill,
            placeholder: (context, url) =>
            new CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
            new Icon(Icons.error),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(orderItem.name,  style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: Colors.black, fontSize: 16),)
      ],
    );
  }

  Widget _buildAppbar(String title) => WidgetAppbarNotSearch(
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    //height: 80,
    left: [
      WidgetAppbarMenuBack(),
    ],
    title: title,
  );
}


