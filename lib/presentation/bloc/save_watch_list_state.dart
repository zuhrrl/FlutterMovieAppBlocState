part of 'save_watch_list_bloc.dart';

abstract class SaveWatchListState extends Equatable {
  const SaveWatchListState();

  @override
  List<Object> get props => [];
}

class initialState extends SaveWatchListState {}

class OnChangeAddedToWatchlist extends SaveWatchListState {
  final bool isAddedToWatchlist;
  OnChangeAddedToWatchlist(this.isAddedToWatchlist);
  @override
  List<Object> get props => [isAddedToWatchlist];
}
