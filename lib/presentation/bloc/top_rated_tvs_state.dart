part of 'top_rated_tvs_bloc.dart';

abstract class TopRatedTvsState extends Equatable {
  const TopRatedTvsState();

  @override
  List<Object> get props => [];
}

class TopRatedTvsInitial extends TopRatedTvsState {}

class TopRatedTvsEmpty extends TopRatedTvsState {}

class TopRatedTvsLoading extends TopRatedTvsState {}

class TopRatedTvsHasData extends TopRatedTvsState {
  final List<Tv> tvs;
  TopRatedTvsHasData(this.tvs);
  @override
  List<Object> get props => [tvs];
}

class TopRatedTvsError extends TopRatedTvsState {
  final String message;

  TopRatedTvsError(this.message);

  @override
  List<Object> get props => [message];
}
