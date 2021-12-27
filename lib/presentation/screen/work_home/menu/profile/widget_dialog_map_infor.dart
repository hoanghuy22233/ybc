import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/common_widgets/widget_view_image.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/map/bloc_detail_user/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/book_appointment/sc_book_appointment.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/rate_user/sc_rate_user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ybc/utils/locale/app_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetDialogMapInfo extends StatefulWidget {
  final int id;
  final String title;

  WidgetDialogMapInfo(
      {Key key,
      this.id,
        this.title
      })
      : super(key: key);

  @override
  _WidgetDialogMapInfoState createState() => _WidgetDialogMapInfoState();
}

class _WidgetDialogMapInfoState extends State<WidgetDialogMapInfo> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<InformationUserBloc>(context)
        .add(RefreshInformationUser(widget.id));
    //_onArgument();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InformationUserBloc, InformationUserState>(
        builder: (context, state) {
          if (state is InformationUserLoaded) {
            return SafeArea(
                top: false,
                child: state.userDetail != null ? AlertDialog(
                  scrollable: true,
                  title: Text(widget.title, style: AppStyle.DEFAULT_MEDIUM_BOLD,),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WidgetViewNetworkImage(image: state?.userDetail?.image)),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                  imageUrl: state?.userDetail?.image ??
                                      'https://picsum.photos/250?image=9',
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) =>
                                  new CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                  new Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(child: Text(state.userDetail.name, style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: Colors.black), )),
                        SizedBox(
                          height: 30,
                        ),
                        Text('SĐT: ${state.userDetail.tel}', style: AppStyle.DEFAULT_SMALL.copyWith(color: Colors.black), ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Địa chỉ: ${state.userDetail.address != null ? state.userDetail.address : "Chưa thiết lập"}', style: AppStyle.DEFAULT_SMALL.copyWith(color: Colors.black), ),
                        SizedBox(
                          height: 10,
                        ),

                        Text('Năm sinh: ${state.userDetail.birthday != null ? DateFormat("yyyy").format(DateFormat("yyyy-MM-dd").parse(state.userDetail.birthday)) : 'Chưa thiết lập'}', style: AppStyle.DEFAULT_SMALL.copyWith(color: Colors.black), ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Chức vụ: ${state.userDetail.roleDisplayName}', style: AppStyle.DEFAULT_SMALL.copyWith(color: Colors.black), ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Nghề nghiệp: ${state.userDetail.job != null ? state.userDetail.job : "Chưa thiết lập"}', style: AppStyle.DEFAULT_SMALL.copyWith(color: Colors.black), ),
                      ],
                    ),
                  ),
                  actions: [
                    GestureDetector(
                      onTap: (){
                        launch("tel://${state.userDetail.tel}");
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/icons/telephone.png'),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/icons/comments.png'),
                      ),
                    ),
                    state.userDetail.roleName != 'chuyengia' ? RaisedButton(
                        child: Text("Đặt lịch"),
                        color: Colors.blue,
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BookAppointmentScreen(image: state.userDetail.image,fullName: state.userDetail.name,)),
                          );
                        }
                    ) : SizedBox(),
                    RaisedButton(
                        child: Text("Đánh giá"),
                        color: Colors.blue,
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RateUserScreen(image: state.userDetail.image,fullName: state.userDetail.name,)),
                          );
                        }
                    ),
                  ],
                ) :
                Center(
                  child: Text('Không có thông tin'),
                )
            );
          } else if (state is InformationUserLoading) {
            return Center(
              child: Container(
                height: 100,
                width: 100,
                child: Lottie.asset(
                  'assets/lottie/trail_loading.json',
                ),
              ),
            );
          } else if (state is InformationUserNotLoaded) {
            return Center(
              child: Text('${state.error}'),
            );
          } else {
            return Center(
              child: Text('Unknown state'),
            );
          }
        });

  }

}


