import 'package:equatable/equatable.dart';
import 'package:ybc/model/entity/banner.dart';

abstract class HomeBannerState extends Equatable {
  const HomeBannerState();

  @override
  List<Object> get props => [];
}

class HomeBannerLoading extends HomeBannerState {}

class HomeBannerLoaded extends HomeBannerState {
  final List<Banners> banners;
  final bool hasReachedMax;

  const HomeBannerLoaded({this.hasReachedMax, this.banners});

  HomeBannerLoaded copyWith({
    List<Banners> banner,
    bool hasReachedMax,
  }) {
    return HomeBannerLoaded(
      banners: banners ?? this.banners,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [banners, hasReachedMax];
}

class HomeBannerNotLoaded extends HomeBannerState {
  final String error;

  HomeBannerNotLoaded(this.error);

  @override
  String toString() {
    return 'HomeBannerNotLoaded{error: $error}';
  }
}
