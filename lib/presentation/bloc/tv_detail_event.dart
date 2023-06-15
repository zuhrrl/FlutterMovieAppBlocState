part of 'tv_detail_bloc.dart';

abstract class TvDetailEvent extends Equatable {
  const TvDetailEvent();

  @override
  List<Object> get props => [];
}

class OnFetchDetailTv extends TvDetailEvent {
  final int tvId;

  OnFetchDetailTv(this.tvId);

  @override
  List<Object> get props => [];
}
