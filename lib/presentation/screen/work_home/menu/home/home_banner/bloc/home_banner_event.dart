import 'package:equatable/equatable.dart';

class HomeBannerEvent extends Equatable {
  const HomeBannerEvent();

  List<Object> get props => [];
}

class LoadHomeBanner extends HomeBannerEvent {}

class RefreshHomeBanner extends HomeBannerEvent {}
