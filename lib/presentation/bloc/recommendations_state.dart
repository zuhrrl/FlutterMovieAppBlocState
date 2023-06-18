part of 'recommendations_bloc.dart';

abstract class RecommendationsState extends Equatable {
  const RecommendationsState();

  @override
  List<Object> get props => [];
}

class RecommendationsEmpty extends RecommendationsState {}

class RecommendationsLoading extends RecommendationsState {}

class RecommendationsTvEmpty extends RecommendationsState {}

class RecommendationsTvLoading extends RecommendationsState {}

class RecommendationsHasData extends RecommendationsState {
  final List<Movie> recommendations;

  RecommendationsHasData(this.recommendations);

  @override
  List<Object> get props => [recommendations];
}

class RecommendationsMovieLoading extends RecommendationsState {}

class RecommendationsHasTvData extends RecommendationsState {
  final List<Tv> recommendations;

  RecommendationsHasTvData(this.recommendations);

  @override
  List<Object> get props => [recommendations];
}

class RecommendationsError extends RecommendationsState {
  final String message;

  RecommendationsError(this.message);

  @override
  List<Object> get props => [message];
}

class RecommendationsTvError extends RecommendationsState {
  final String message;

  RecommendationsTvError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieRecommendationsError extends RecommendationsState {
  final String message;

  MovieRecommendationsError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieRecommendationsHasData extends RecommendationsState {
  final List<Movie> recommendations;

  MovieRecommendationsHasData(this.recommendations);

  @override
  List<Object> get props => [recommendations];
}
