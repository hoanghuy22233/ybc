import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:ybc/app/auth_bloc/authentication_bloc.dart';
import 'package:ybc/app/auth_bloc/authentication_event.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/widget_view_image.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/widget_item_profile.dart';
import 'package:ybc/utils/locale/app_localization.dart';

import 'bloc/bloc.dart';

class UserInformation extends StatefulWidget {
  UserInformation({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation>
    with AutomaticKeepAliveClientMixin<UserInformation> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
  }

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    openLoading();
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileLoaded) {
        return _buildContent(state);
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
    }); // This trailing comma makes auto-formatting nicer for build methods.
  }

  _buildContent(ProfileLoaded state) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<ProfileBloc>(context).add(RefreshProfile());
        await Future.delayed(Duration(seconds: 2));
        return true;
      },
      color: AppColor.PRIMARY_COLOR,
      backgroundColor: Colors.blue,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildNameCard(state),
            SizedBox(
              height: 5,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () => AppNavigator.navigateChangeProfile(),
                    child: Text("Sửa profile > ",
                        style: AppStyle.DEFAULT_SMALL
                            .copyWith(color: Colors.blue)))),
            SizedBox(
              height: 5,
            ),
            _buildInfo(state),
            WidgetItemProfile(
              left: 'Dự án đang tham gia',
              right: '(0)',
              ontap: () {
                AppNavigator.navigateProjectParticipating();
              },
            ),
            WidgetItemProfile(
              left: AppLocalizations.of(context)
                  .translate('product_bought.title'),
              ontap: () {
                AppNavigator.navigateBoughtProduct();
              },
            ),
            WidgetItemProfile(
              left:
              AppLocalizations.of(context).translate('history_order.title'),
              ontap: () {
                AppNavigator.navigateHistoryOrder();
              },
            ),
            WidgetItemProfile(
              left: AppLocalizations.of(context)
                  .translate('change_password.title'),
              ontap: () {
                AppNavigator.navigateChangePassword();
              },
            ),
            WidgetItemProfile(
              left: AppLocalizations.of(context)
                  .translate('register_contact.title'),
              ontap: () {
                AppNavigator.navigateRegisterContact();
              },
            ),
            SizedBox(
              height: 20,
            ),
            _buildButtonLogout(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  _buildNameCard(ProfileLoaded state) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue[600]),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      margin: EdgeInsets.only(top: 5, left: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      WidgetViewNetworkImage(image: state.user.image)),
                            );
                          },
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
                        // child: Image.network(state?.user?.image ??
                        //     'https://picsum.photos/250?image=9', fit: BoxFit.fill,),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(state?.user?.name ?? 'abc',
                            style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith()),
                        SizedBox(
                          width: 10,
                        ),
                        state?.user?.gender != null
                            ? state.user.gender == '1'
                                ? Container(
                                    child: Image.asset(
                                      'assets/images/male.png',
                                      height: 15,
                                      width: 15,
                                      color: Colors.blue,
                                    ),
                                  )
                                : Container(
                                    child: Image.asset(
                                      'assets/images/female.png',
                                      height: 15,
                                      width: 15,
                                      color: Colors.pink,
                                    ),
                                  )
                            : Container(
                                child: Icon(
                                  Icons.wc_outlined,
                                  size: 15,
                                  color: Colors.lightGreen,
                                ),
                              )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          child: Text(
                            "Dùng thử",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothStarRating(
                            allowHalfRating: false,
                            onRated: (v) {
                            },
                            starCount: 5,
                            rating: 5,
                            size: 20.0,
                            isReadOnly:true,
                            color: Colors.amber,
                            borderColor: Colors.amber,
                            spacing: 0.0),
                        GestureDetector(
                          onTap: () {
                            AppNavigator.navigateListRate();
                          },
                          child: Text(
                            'Xem thêm',
                            style: AppStyle.DEFAULT_SMALL.copyWith(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                        onTap: () {
                          AppNavigator.navigateInformationAccount();
                        },
                        child: Text(
                          "Thông tin tài khoản >",
                          style: AppStyle.DEFAULT_SMALL,
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }

  _buildInfo(ProfileLoaded state) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              _buildInfoItem(
                  "Ngày sinh: ",
                  state.user.birthday != null
                      ? DateFormat("dd-MM-yyyy").format(
                      DateFormat("yyyy-MM-dd").parse(state?.user?.birthday))
                      : 'Chưa thiết lập'),
              _buildInfoItem(
                  "Số điện thoại: ", state?.user?.tel ?? 'Chưa thiết lập'),
              _buildInfoItem("Email: ", state?.user?.email ?? 'Chưa thiết lập'),
              _buildInfoItem(
                  "Địa chỉ: ", state?.user?.address ?? 'Chưa thiết lập'),
              _buildInfoItem("Công việc đang làm: ",
                  state?.user?.roleDisplayName ?? 'Chưa thiết lập'),
              _buildInfoItem(
                  "Ngành nghề: ", state?.user?.job ?? 'Chưa thiết lập'),
              _buildInfoItem("Facebook: ", 'Chưa thiết lập'),
              _buildInfoItem("Zalo: ", 'Chưa thiết lập'),
              Text("Lời giới thiệu:", style: AppStyle.DEFAULT_SMALL.copyWith()),
              SizedBox(
                height: 5,
              ),
              Text(
                state?.user?.intro ?? "Chưa thiết lập",
                style: AppStyle.DEFAULT_SMALL.copyWith(),
                textAlign: TextAlign.justify,
              ),
            ],
          )),
    );
  }

  _buildInfoItem(String left, String right) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(left, style: AppStyle.DEFAULT_SMALL.copyWith()),
            Flexible(
              fit: FlexFit.loose,
              child: Text(right, style: AppStyle.DEFAULT_SMALL.copyWith(),
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
        Divider(
          height: 20,
          thickness: 0.8,
          color: Colors.black,
        )
      ],
    );
  }

  _buildButtonLogout() {
    return GestureDetector(
      onTap: () async {
        // var result = await ConfirmDialog.show(
        //     context, "Bạn chắc chắn muốn đăng xuất?",
        //     ok: 'Đồng ý', cancel: 'Huỷ');
        // if (result == true) {
        //   BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
        //   AppNavigator.navigateWorkService();
        // }
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                scrollable: true,
                title: Text(
                  "Đăng xuất",
                  style: AppStyle.DEFAULT_MEDIUM_BOLD
                      .copyWith(color: Colors.red, fontSize: 16),
                ),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                        "Bạn muốn đăng xuất tài khoản này?",
                        style: AppStyle.DEFAULT_SMALL_BOLD
                            .copyWith(color: Colors.black),
                      )),
                ),
                actions: [
                  RaisedButton(
                      child: Text("Không"),
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                      }),
                  RaisedButton(
                      child: Text("Có"),
                      color: Colors.red,
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(LoggedOut());
                        _logOut();
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Lottie.asset(
                                      'assets/lottie/trail_loading.json',
                                    ),
                                  ),
                                ),
                              );
                            });
                        Future.delayed(Duration(seconds: 2), () {
                          AppNavigator.navigateWorkService();
                        });
                      }
                  )

                ],
              );
            });
      },
      child: Card(
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: Text("Đăng xuất",
              style: AppStyle.DEFAULT_MEDIUM.copyWith(color: Colors.white)),
        ),
      ),
    );
  }

  void openLoading() async {
    BlocProvider.of<ProfileBloc>(context).add(RefreshProfile());
  }

  Future<Null> _logOut() async {
    await facebookSignIn.logOut();
  }
}
