part of 'tv_detail_bloc.dart';

abstract class TvDetailState extends Equatable {
  const TvDetailState();

  @override
  List<Object> get props => [];
}

class TvDetailInitial extends TvDetailState {}

class TvDetailEmpty extends TvDetailState {}

class TvDetailLoading extends TvDetailState {}

class TvRecommendationLoading extends TvDetailState {}

class TvDetailError extends TvDetailState {
  final String message;

  TvDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class TvDetailHasData extends TvDetailState {
  final TvDetail tvDetail;

  TvDetailHasData(this.tvDetail);

  @override
  List<Object> get props => [TvDetail];
}

class TvRecommendationsHasData extends TvDetailState {
  final List<Tv> recommendations;

  TvRecommendationsHasData(this.recommendations);

  @override
  List<Object> get props => [recommendations];
}

class TvRecommendationError extends TvDetailState {
  final String message;

  TvRecommendationError(this.message);

  @override
  List<Object> get props => [message];
}

class initialState extends TvDetailState {}

// class OnChangeAddedToWatchlist extends TvDetailState {
//   final bool isAddedToWatchlist;
//   OnChangeAddedToWatchlist(this.isAddedToWatchlist);
//   @override
//   List<Object> get props => [isAddedToWatchlist];
// }
