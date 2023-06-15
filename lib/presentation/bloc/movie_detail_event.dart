part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class OnFetchDetailMovie extends MovieDetailEvent {
  final int movieId;

  OnFetchDetailMovie(this.movieId);

  @override
  List<Object> get props => [];
}
