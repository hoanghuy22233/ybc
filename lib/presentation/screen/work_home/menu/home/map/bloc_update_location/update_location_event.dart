import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UpdateLocationEvent extends Equatable {
  const UpdateLocationEvent();

  @override
  List<Object> get props => [];
}

class UpdateLocationSubmit extends UpdateLocationEvent {
  final String apiToken;
  final String lat;
  final String long;

  const UpdateLocationSubmit({@required this.lat, @required this.long, @required this.apiToken});

  @override
  List<Object> get props => [lat, long, apiToken];

  @override
  String toString() {
    return 'UpdateLocation{apiToken: $apiToken,lat: $lat,long: $long}';
  }
}
