import 'package:equatable/equatable.dart';
import 'package:ybc/model/api/response/home_response.dart';
import 'package:ybc/utils/dio/dio_status.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeResponse homeResponse;

  const HomeLoaded({this.homeResponse});

  @override
  List<Object> get props => [homeResponse];

  @override
  String toString() {
    return 'HomeLoaded{homeResponse: $homeResponse}';
  }
}

class HomeNotLoaded extends HomeState {
  final DioStatus status;

  HomeNotLoaded({this.status});

  @override
  String toString() {
    return 'HomeNotLoaded{error: $status}';
  }
}
