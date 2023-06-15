part of 'recommendations_bloc.dart';

abstract class RecommendationsEvent extends Equatable {
  const RecommendationsEvent();

  @override
  List<Object> get props => [];
}

class OnFetchRecommendation extends RecommendationsEvent {
  final int movieId;

  OnFetchRecommendation(this.movieId);

  @override
  List<Object> get props => [];
}

class OnFetchTvRecommendation extends RecommendationsEvent {
  final int tvId;

  OnFetchTvRecommendation(this.tvId);

  @override
  List<Object> get props => [];
}
