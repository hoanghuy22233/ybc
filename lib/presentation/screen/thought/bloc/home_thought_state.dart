import 'package:equatable/equatable.dart';
import 'package:ybc/model/entity/thought.dart';

abstract class HomeThoughState extends Equatable {
  const HomeThoughState();

  @override
  List<Object> get props => [];
}

class HomeThoughLoading extends HomeThoughState {}

class HomeThoughLoaded extends HomeThoughState {
  final List<Thought> thought;
  final bool hasReachedMax;

  const HomeThoughLoaded({this.hasReachedMax, this.thought});

  HomeThoughLoaded copyWith({
    List<Thought> thought,
    bool hasReachedMax,
  }) {
    return HomeThoughLoaded(
      thought: thought ?? this.thought,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [thought, hasReachedMax];
}

class HomeThoughNotLoaded extends HomeThoughState {
  final String error;

  HomeThoughNotLoaded(this.error);

  @override
  String toString() {
    return 'HomeThoughNotLoaded{error: $error}';
  }
}
