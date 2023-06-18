part of 'tv_detail_bloc.dart';

abstract class TvDetailEvent extends Equatable {
  const TvDetailEvent();

  @override
  List<Object> get props => [];
}

class OnFetchRecommendation extends TvDetailEvent {
  final int tvId;

  OnFetchRecommendation(this.tvId);

  @override
  List<Object> get props => [];
}

class OnFetchDetailTv extends TvDetailEvent {
  final int tvId;

  OnFetchDetailTv(this.tvId);
}

// class OnChangeWatchlistTv extends TvDetailEvent {
//   final int tvId;
//   final TvDetail tvDetail;
//   final bool isSaveWatchlist;

//   OnChangeWatchlistTv(this.tvId, this.tvDetail, this.isSaveWatchlist);

//   @override
//   List<Object> get props => [];
// }

// class OnInitWatchlistTv extends TvDetailEvent {
//   final int tvId;

//   OnInitWatchlistTv(this.tvId);

//   @override
//   List<Object> get props => [];
// }
