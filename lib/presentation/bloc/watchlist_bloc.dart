import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:ditonton/domain/usecases/get_watchlist.dart';
import 'package:equatable/equatable.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  GetWatchlist getWatchlist;
  WatchlistBloc(this.getWatchlist) : super(WatchlistInitial()) {
    on<WatchlistEvent>((event, emit) async {
      emit(WatchlistLoading());

      final watchLists = await getWatchlist.execute();

      watchLists.fold(
        (failure) {
          emit(WatchlistError(failure.message));
        },
        (watchlist) {
          emit(WatchlistHasData(watchlist));
        },
      );
    });
  }
}
