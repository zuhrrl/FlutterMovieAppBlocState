part of 'save_watch_list_bloc.dart';

abstract class SaveWatchListEvent extends Equatable {
  const SaveWatchListEvent();

  @override
  List<Object> get props => [];
}

class OnChangeWatchlist extends SaveWatchListEvent {
  final int movieId;
  final MovieDetail movieDetail;
  final bool isSaveWatchlist;

  OnChangeWatchlist(this.movieId, this.movieDetail, this.isSaveWatchlist);

  @override
  List<Object> get props => [];
}

class OnInitWatchlist extends SaveWatchListEvent {
  final int movieId;

  OnInitWatchlist(this.movieId);

  @override
  List<Object> get props => [];
}

class OnChangeWatchlistTv extends SaveWatchListEvent {
  final int tvId;
  final TvDetail tvDetail;
  final bool isSaveWatchlist;

  OnChangeWatchlistTv(this.tvId, this.tvDetail, this.isSaveWatchlist);

  @override
  List<Object> get props => [];
}

class OnInitWatchlistTv extends SaveWatchListEvent {
  final int movieId;

  OnInitWatchlistTv(this.movieId);

  @override
  List<Object> get props => [];
}
