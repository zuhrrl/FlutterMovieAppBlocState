part of 'now_playing_tv_bloc.dart';

abstract class NowPlayingTvState extends Equatable {
  const NowPlayingTvState();

  @override
  List<Object> get props => [];
}

class NowPlayingTvInitial extends NowPlayingTvState {}

class NowPlayingTvEmpty extends NowPlayingTvState {}

class NowPlayingTvLoading extends NowPlayingTvState {}

class NowPlayingTvHasData extends NowPlayingTvState {
  final List<Tv> tvs;
  NowPlayingTvHasData(this.tvs);
  @override
  List<Object> get props => [tvs];
}

class NowPlayingTvError extends NowPlayingTvState {
  final String message;

  NowPlayingTvError(this.message);

  @override
  List<Object> get props => [message];
}
