import 'dart:math';

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
import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:ybc/model/entity/user_location.dart';
import 'package:ybc/presentation/common_widgets/widget_view_image.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/map/bloc_detail_user/information_user_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/map/bloc_detail_user/information_user_event.dart';
import 'bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/widget_dialog_map_infor.dart';
import 'package:ybc/utils/locale/app_localization.dart';

class NearlyUser extends StatefulWidget {
  final double radius, lat, long;
  NearlyUser({Key key, this.radius, this.lat, this.long}) : super(key: key);

  @override
  _NearlyUserState createState() => _NearlyUserState();
}

class _NearlyUserState extends State<NearlyUser>
    with AutomaticKeepAliveClientMixin<NearlyUser> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserLocationBloc>(context).add(LoadUserLocation());
  }

  List<UserLocation> nearlyUser = [];

  double distanceInMeterBetween({double lat1, double long1, double lat2, double long2}) {
    var dLat = (lat2-lat1)*0.017453292;
    var dLon = (long2-long1)*0.017453292;

    lat1 = lat1*0.017453292;
    lat2 = lat2*0.017453292;

    var a = sin(dLat/2) * sin(dLat/2) +
        sin(dLon/2) * sin(dLon/2) * cos(lat1) * cos(lat2);
    var c = 2 * atan2(sqrt(a), sqrt(1-a));
    return 6371 * c * 1000;
  }

  void openLogins(UserLocationLoaded state){
    nearlyUser.clear();
    for(UserLocation user in state.user){
      print('lat1: ${user.lat} , long1: ${user.long}');
      print('lat2: ${widget.lat} , long2: ${widget.long}');
      if(distanceInMeterBetween(lat1: double.parse(user.lat), long1: double.parse(user.long), lat2: widget.lat, long2: widget.long) <= widget.radius){
        nearlyUser.add(user);
        print('ok dmmm');
      }
    }
    print('so luong abc: ${nearlyUser.length}');
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<UserLocationBloc, UserLocationState>(builder: (context, state) {
      if (state is UserLocationLoaded) {
        openLogins(state);
        return _buildContent();
      } else if (state is UserLocationLoading) {
        return Center(
          child: Container(
            height: 100,
            width: 100,
            child: Lottie.asset(
              'assets/lottie/trail_loading.json',
            ),
          ),
        );
      } else if (state is UserLocationNotLoaded) {
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

  _buildContent() {
      return Container(
        height: MediaQuery.of(context).size.height*0.5,
        width: MediaQuery.of(context).size.width,
        
        child: ListView.builder(
          itemCount: nearlyUser.length,
          itemBuilder: (context, index) {
            return _buildNameCard(nearlyUser[index]);
          },
        ),
      );
  }

  _buildNameCard(UserLocation user) {
    print('xxx ${user.name}');
    return GestureDetector(
      onTap: (){
        print('id user: ${user.id.toString()}');
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return WidgetDialogMapInfo(
                title: AppLocalizations.of(context).translate('map.information'),
                id: user.id,
              );
            });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
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
                                WidgetViewNetworkImage(image: user.avatar)),
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl: user.avatar ??
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
              SizedBox(width: 20,),
              Text(user.name,
                  style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith()),
            ],
          ),
        ),
      ),
    );
  }
}