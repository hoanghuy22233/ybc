import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ybc/app/constants/style/style.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/common_widgets/widget_circle_progress.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_bloc.dart';
import 'package:ybc/presentation/screen/work_home/cart/bloc/cart_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_account/widget_appbar_not_search.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/bloc.dart';

import '../widget_item_profile.dart';

class InformationAccountScreen extends StatefulWidget {
  @override
  _InformationAccountScreenState createState() =>
      _InformationAccountScreenState();
}

class _InformationAccountScreenState extends State<InformationAccountScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
    BlocProvider.of<CartBloc>(context).add(LoadCart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        if (state is ProfileLoaded) {
          return _buildContent(context, state);
        } else if (state is ProfileLoading) {
          return Center(
            child: WidgetCircleProgress(),
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
    );
  }

  _buildContent(BuildContext context, ProfileLoaded state) {
    return SafeArea(
      top: true,
      child: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            _buildAppbar('Thông tin tài khoản'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(overflow: Overflow.visible, children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Image.asset(
                      'assets/images/banner.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: -40,
                    left: MediaQuery.of(context).size.width * 0.4 - 5,
                    child: Container(
                      height: 70,
                      width: 70,
                      margin: EdgeInsets.only(top: 5, left: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: state?.user?.image ??
                              'https://picsum.photos/250?image=9',
                          fit: BoxFit.fill,
                          placeholder: (context, url) =>
                          new CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                        ),
                      ),
                    ),
                  )
                ]),
                Container(
                  height: 60,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(state?.user?.name ?? 'Chưa thiết lập',
                            style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith()),
                        SizedBox(
                          height: 5,
                        ),
                        Card(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              child: Text(
                                "Dùng thử",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'HSD: 15:20 - 15/01/2021 đến 15:20 - 15/02/2021',
                          style: AppStyle.DEFAULT_SMALL,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        WidgetItemProfile(
                            left: 'Gia hạn tài khoản', right: '12/02/2021'),
                        WidgetItemProfile(
                            left: 'Thông tin phiên bản', right: 'V0.002'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppbar(String title) => WidgetAppbarNotSearch(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        left: [WidgetAppbarMenuBack()],
        title: title,
      );
}
