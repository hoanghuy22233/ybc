import 'dart:async';
import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/app/constants/preferences/app_preferences.dart';
import 'package:ybc/model/repo/barrel_repo.dart';
import 'package:ybc/presentation/common_widgets/widget_appbar_menu_back.dart';
import 'package:ybc/presentation/screen/work_home/menu/home/map/nearly_user.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/widget_dialog_map_infor.dart';
import 'package:ybc/utils/locale/app_localization.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'bloc/bloc.dart';
import 'bloc_update_location/bloc.dart';

class MapUser extends StatefulWidget {
  @override
  _MapUserState createState() => _MapUserState();
}

class _MapUserState extends State<MapUser> {

  GoogleMapController mapController;
  static LatLng _center = const LatLng(21.007353, 105.781346);
  static LatLng DEST_LOCATION = LatLng(21.027353, 105.721346);
  Set<Marker> _markers = {};
  Set<Circle> _circles = {};

  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = 'AIzaSyC5sashDXaKHiNRR4DO4fDTnRQHMWnNbLI';
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/icons/comments.png');
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/icons/chat.png');
  }

  int _circleIdCounter = 1;
  double radius;
  LatLng _currentMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  bool isLoading = true;
  String apiToken;
  UserRepository repository;

  void _setCircles(LatLng point) {
    final String circleIdVal = 'circle_id_$_circleIdCounter';
    _circleIdCounter++;
    print(
        'Circle | Latitude: ${point.latitude}  Longitude: ${point.longitude}  Radius: $radius');
    _circles.add(
      Circle(
        circleId: CircleId(circleIdVal),
        center: point,
        radius: radius,
        fillColor: Colors.blue[100],
        strokeWidth: 3,
        strokeColor: Colors.blue[300])
    );
  }

  void _onCameraMove(CameraPosition position) {
    _currentMapPosition = position.target;
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }
  BitmapDescriptor pinLocationIcon;

  Completer<GoogleMapController> _controller = Completer();

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Future _checkGps() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Không thể lấy vị trí hiện tại của bạn!"),
              content:
              const Text('Hãy bật GPS và thử lại'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    final AndroidIntent intent = AndroidIntent(
                        action: 'android.settings.LOCATION_SOURCE_SETTINGS');
                    intent.launch();
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  Position _currentPosition;
  UpdateLocationBloc updateLocation;
  ProfileBloc profileBloc;
  String userName='';
  double lat, long;

  _onArgument() {
    Future.delayed(Duration.zero, () async {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      setState(() {
        lat = arguments['lat'];
        print('---lat haha: $lat---');
        long = arguments['long'];
        print('---long haha: $long---');
      });
    });
  }

  _getCurrentLatLong(GoogleMapController controller) {
    _checkGps();
    geolocator
        .getCurrentPosition()
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print("hahaha ${_currentPosition.latitude}, ${_currentPosition.longitude}");

      });
    }).catchError((e) {
      print(e);
    });

    Future.delayed(Duration(seconds: 2), () {
      //Navigator.of(context, rootNavigator: true).pop('dialog');
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(lat, long),zoom: 14),
        ),
      );
    });
  }

  _getCurrentLocation(GoogleMapController controller) {
    _checkGps();
    //WidgetCircleProgress();
    geolocator
        .getCurrentPosition()
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print("${_currentPosition.latitude}, ${_currentPosition.longitude}");


        BlocProvider.of<UpdateLocationBloc>(context).add(
            UpdateLocationSubmit(
                apiToken: apiToken,
                lat: _currentPosition.latitude.toString(),
                long: _currentPosition.longitude.toString()));
        FocusScope.of(context).unfocus();

        for(Marker marker in _markers){
          if(marker.markerId.value.trim() == userName){
            //print('id marker: ${_markers.}');
            _markers.remove(marker);
            //marker.position = LatLng(_currentPosition.latitude, _currentPosition.longitude);
          }
        }
      });
    }).catchError((e) {
      print(e);
    });
    //BlocProvider.of<UserLocationBloc>(context).add(RefreshUserLocation());
    Future.delayed(Duration(seconds: 2), () {
      //Navigator.of(context, rootNavigator: true).pop('dialog');

      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(_currentPosition.latitude, _currentPosition.longitude),zoom: 15),
        ),
      );
      setState(() {
        final marker1 = Marker(
          markerId: MarkerId('Vị trí của tôi'),
          position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
          infoWindow: InfoWindow(
            title: 'Vị trí của tôi',
            onTap: () {

            },
          ),
          //icon: BitmapDescriptor.fromAsset('assets/images/rec.png'),
          icon: BitmapDescriptor.defaultMarker,
        );
        _markers.add(marker1);
      });
    });

  }


  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserLocationBloc>(context).add(LoadUserLocation());
    _onArgument();
    setSourceAndDestinationIcons();
    //BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
    //_getCurrentLatLong(mapController);
  }

  void setMapPins() {
    setState(() {
      // source pin
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: _center,
          icon: sourceIcon
      ));
      // destination pin
      _markers.add(Marker(
          markerId: MarkerId('destPin'),
          position: DEST_LOCATION,
          icon: destinationIcon
      ));
    });
  }

  setPolylines() async {
    List<PointLatLng> result = await
    polylinePoints?.getRouteBetweenCoordinates(
        googleAPIKey,
        _center.latitude,
        _center.longitude,
        DEST_LOCATION.latitude,
        DEST_LOCATION.longitude);
    if(result.isNotEmpty){
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      result.forEach((PointLatLng point){
        polylineCoordinates.add(
            LatLng(point.latitude, point.longitude));
      });
    }
    setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
          polylineId: PolylineId('poly'),
          color: Color.fromARGB(255, 40, 122, 198),
          points: polylineCoordinates
      );

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
  }

  void openLogins(UserRepository repository) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(AppPreferences.auth_token);
    apiToken = token;
    final username = prefs.getString('userName');
    userName = username;
  }

  @override
  Widget build(BuildContext context) {
    Timer timer = Timer(Duration(seconds: 3), () {
      setState(() {
        openLogins(repository);
        isLoading = false;
      });
    });

    return BlocBuilder<UserLocationBloc, UserLocationState>(builder: (context, state) {
      if (state is UserLocationLoaded) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: SafeArea(
              top: true,
              child: Stack(
                children: <Widget>[
                  GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(lat, long),
                        zoom: 12.0,
                      ),
                      mapType: _currentMapType,
                      markers: _markers,
                      circles: _circles,
                      polylines: _polylines,
                      onCameraMove: _onCameraMove,
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                        _controller.complete(mapController);
                        setState(() {
                          for(int i=0; i < state.user.length ; i++){
                            if(state.user[0].lat != null && state.user[0].lat!= null){
                              var marker = Marker(
                                markerId: MarkerId(state.user[i].name),
                                position: LatLng(double.parse(state.user[i].lat), double.parse(state.user[i].long)),
                                infoWindow: InfoWindow(
                                  title: state.user[i].name,
                                  onTap: () {
                                    print('id user: ${state.user[i].id.toString()}');
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return WidgetDialogMapInfo(
                                            title: AppLocalizations.of(context).translate('map.information'),
                                            id: state.user[i].id,
                                          );
                                        });
                                  },
                                ),
                                icon: BitmapDescriptor.defaultMarker,
                              );
                              _markers.add(marker);
                            }
                          }
                          setMapPins();
                          setPolylines();
                          // for(int i=0; i < 50 ; i++){
                          //   controller.animateCamera(
                          //     CameraUpdate.newCameraPosition(
                          //       CameraPosition(
                          //           target: LatLng(_center.latitude, _center.longitude), zoom: 12.0),
                          //     ),
                          //   );
                          //   final marker = Marker(
                          //     markerId: MarkerId(i.toString()),
                          //     position: LatLng(_center.latitude+i*0.0011, _center.longitude+i*0.0021),
                          //     infoWindow: InfoWindow(
                          //       title: i.toString(),
                          //       //onTap: () => AppNavigator.navigateNewsDetail(mapUserItem[i].id),
                          //     ),
                          //     icon: BitmapDescriptor.defaultMarker,
                          //   );
                          //   _markers.add(marker);
                          // }
                        }
                        );
                      }
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: FloatingActionButton(
                      mini: true,
                      onPressed: _onMapTypeButtonPressed,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.map,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 5,
                    child: WidgetAppbarMenuBack(
                      backgroundColor: Colors.blue,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 110,
                    right: 15,
                    child: GestureDetector(
                      onTap: (){
                        _getCurrentLocation(mapController);
                      },
                      child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                          child: Icon(Icons.my_location, color: Colors.black,)
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 160,
                    right: 15,
                    child: Tooltip(
                      message: 'Tìm quanh đây',
                      child: GestureDetector(
                        onTap: (){
                          radius = 50;
                          return showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  //backgroundColor: Colors.grey[900],
                                  title: Text(
                                    'Chọn khoảng cách (m)',
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14),
                                  ),
                                  content: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Material(
                                        color: Colors.grey[300],
                                        child: TextField(
                                          style: TextStyle(fontSize: 16, color: Colors.black),
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            icon: Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Icon(Icons.zoom_out_map, color: Colors.blue,),
                                            ),
                                            hintText: 'VD: 100',
                                            suffixText: 'mét ',
                                            border: InputBorder.none,

                                          ),
                                          keyboardType: TextInputType.numberWithOptions(),
                                          onChanged: (input) {
                                            setState(() {
                                              radius = double.parse(input);
                                              _circles.clear();
                                              _setCircles(LatLng(lat,long));
                                            });
                                          },
                                        ),
                                      )),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () {
                                          AppNavigator.navigateBack();
                                          showMaterialModalBottomSheet(
                                            context: context,
                                            builder: (context) => NearlyUser(lat: lat, long: long, radius: radius,),
                                          );
                                        },
                                        child: Text(
                                          'Tìm kiếm',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,),
                                        )),
                                  ],
                                );
                              });
                        },
                        child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                            child: Icon(Icons.search_outlined, color: Colors.black,)
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ),
        );
      } else if (state is UserLocationLoading) {
        return Scaffold(
          body: Center(
            child: isLoading ? Container(
              height: 100,
              width: 100,
              child: lottie.Lottie.asset(
                'assets/lottie/trail_loading.json',
              ),
            ) : Text('Chưa có vị trí')
          ),
        );
      } else if (state is UserLocationNotLoaded) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/images/error-404.png"),
                ),
                SizedBox(height: 20,),
                Text('Lỗi server!', style: AppStyle.DEFAULT_LARGE_BOLD.copyWith(color: Colors.red),),
              ],
            ),
          ),
        );
      } else {
        return Scaffold(
          body: Center(
            child: Text('Unknown state'),
          ),
        );
      }
    });

    //   BlocListener<UserLocationBloc, UserLocationState>(
    //   listener: (context, state) async {
    //     if (state.isLoading) {
    //       await HttpHandler.resolve(status: state.status);
    //     }
    //
    //     if (state.isSuccess) {
    //       await HttpHandler.resolve(status: state.status);
    //       print("_____________");
    //       print(state.status);
    //     }
    //
    //     if (state.isFailure) {
    //       await HttpHandler.resolve(status: state.status);
    //       print(state.status);
    //     }
    //   },
    //   child: BlocBuilder<UserLocationBloc, UserLocationState>(
    //     builder: (context, state) {
    //       if(state.userLocation != null){
    //         return MaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           home: Scaffold(
    //             body: Stack(
    //               children: <Widget>[
    //                 GoogleMap(
    //                     initialCameraPosition: CameraPosition(
    //                       target: _center,
    //                       zoom: 12.0,
    //                     ),
    //                     mapType: _currentMapType,
    //                     markers: _markers,
    //                     onCameraMove: _onCameraMove,
    //                     onMapCreated: (GoogleMapController controller) {
    //                       mapController = controller;
    //                       _controller.complete(mapController);
    //                       setState(() {
    //                         for(int i=0; i < state.userLocation.length ; i++){
    //                           if(state.userLocation[0].lat != null && state.userLocation[0].lat!= null){
    //                             controller.animateCamera(
    //                               CameraUpdate.newCameraPosition(
    //                                 CameraPosition(
    //                                     target: LatLng(double.parse(state.userLocation[0].lat), double.parse(state.userLocation[0].long)), zoom: 12.0),
    //                               ),
    //                             );
    //                             final marker = Marker(
    //                               markerId: MarkerId(state.userLocation[i].name),
    //                               position: LatLng(double.parse(state.userLocation[i].lat), double.parse(state.userLocation[i].long)),
    //                               infoWindow: InfoWindow(
    //                                 title: state.userLocation[i].name,
    //                                 onTap: () {
    //                                   showDialog(
    //                                       context: context,
    //                                       builder: (BuildContext context) {
    //                                         return WidgetDialogMapInfo(
    //                                           title: AppLocalizations.of(context).translate('list_rate.info_account'),
    //                                           image: mapUserItem[i].image,
    //                                           job: mapUserItem[i].job,
    //                                           position: mapUserItem[i].position,
    //                                           fullName: mapUserItem[i].name,
    //                                           isExpert: mapUserItem[i].isExpert,
    //                                           dob: mapUserItem[i].dob,
    //                                         );
    //                                       });
    //                                 },
    //                               ),
    //                               icon: BitmapDescriptor.defaultMarker,
    //                             );
    //                             _markers.add(marker);
    //                           }
    //                         }
    //
    //                         // for(int i=0; i < 50 ; i++){
    //                         //   controller.animateCamera(
    //                         //     CameraUpdate.newCameraPosition(
    //                         //       CameraPosition(
    //                         //           target: LatLng(_center.latitude, _center.longitude), zoom: 12.0),
    //                         //     ),
    //                         //   );
    //                         //   final marker = Marker(
    //                         //     markerId: MarkerId(i.toString()),
    //                         //     position: LatLng(_center.latitude+i*0.0011, _center.longitude+i*0.0021),
    //                         //     infoWindow: InfoWindow(
    //                         //       title: i.toString(),
    //                         //       //onTap: () => AppNavigator.navigateNewsDetail(mapUserItem[i].id),
    //                         //     ),
    //                         //     icon: BitmapDescriptor.defaultMarker,
    //                         //   );
    //                         //   _markers.add(marker);
    //                         // }
    //                       }
    //                       );
    //                     }
    //                 ),
    //                 Positioned(
    //                   top: 30,
    //                   right: 20,
    //                   child: FloatingActionButton(
    //                     mini: true,
    //                     onPressed: _onMapTypeButtonPressed,
    //                     backgroundColor: Colors.white,
    //                     child: Icon(
    //                       Icons.map,
    //                       color: Colors.green,
    //                     ),
    //                   ),
    //                 ),
    //                 Positioned(
    //                   top: 20,
    //                   left: 10,
    //                   child: WidgetAppbarMenuBack(
    //                     backgroundColor: Colors.blue,
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //                 Positioned(
    //                   bottom: 100,
    //                   right: 15,
    //                   child: GestureDetector(
    //                     onTap: (){
    //                       _getCurrentLocation(mapController);
    //                     },
    //                     child: Container(
    //                         height: 35,
    //                         width: 35,
    //                         decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
    //                         child: Icon(Icons.my_location, color: Colors.black,)
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //
    //           ),
    //         );
    //       }
    //       else{
    //         return isLoading ? Scaffold(body: Center(child: WidgetCircleProgress(),)) : Scaffold(body: Center(child: Text("Chưa có thành viên nào cập nhật vị trí!")));
    //       }
    //     },
    //   ),
    // );


  }
}
