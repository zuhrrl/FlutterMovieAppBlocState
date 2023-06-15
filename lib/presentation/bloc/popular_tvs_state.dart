part of 'popular_tvs_bloc.dart';

abstract class PopularTvsState extends Equatable {
  const PopularTvsState();

  @override
  List<Object> get props => [];
}

class PopularTvsInitial extends PopularTvsState {}

class PopularTvsEmpty extends PopularTvsState {}

class PopularTvsLoading extends PopularTvsState {}

class PopularTvsHasData extends PopularTvsState {
  final List<Tv> tvs;
  PopularTvsHasData(this.tvs);
  @override
  List<Object> get props => [tvs];
}

class PopularTvsError extends PopularTvsState {
  final String message;

  PopularTvsError(this.message);

  @override
  List<Object> get props => [message];
}
