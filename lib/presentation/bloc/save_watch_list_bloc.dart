import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/remove_watchlist_tv.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist_tv.dart';
import 'package:equatable/equatable.dart';

part 'save_watch_list_event.dart';
part 'save_watch_list_state.dart';

class SaveWatchListBloc extends Bloc<SaveWatchListEvent, SaveWatchListState> {
  final GetWatchListStatus getWatchListStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;
  final RemoveWatchlistTv removeWatchlistTv;
  final SaveWatchListTv saveWatchListTv;

  SaveWatchListBloc(this.getWatchListStatus, this.saveWatchlist,
      this.removeWatchlist, this.removeWatchlistTv, this.saveWatchListTv)
      : super(initialState()) {
    on<OnInitWatchlist>(
      (event, emit) async {
        final isSavedWatchlist =
            await getWatchListStatus.execute(event.movieId);
        if (isSavedWatchlist) {
          return emit(OnChangeAddedToWatchlist(true));
        }
        return emit(OnChangeAddedToWatchlist(false));
      },
    );

    on<OnInitWatchlistTv>(
      (event, emit) async {
        final isSavedWatchlist =
            await getWatchListStatus.execute(event.movieId);
        if (isSavedWatchlist) {
          return emit(OnChangeAddedToWatchlist(true));
        }
        return emit(OnChangeAddedToWatchlist(false));
      },
    );
    on<OnChangeWatchlist>((event, emit) async {
      final int movieId = event.movieId;
      final MovieDetail movieDetail = event.movieDetail;

      final isSavedWatchlist = await getWatchListStatus.execute(movieId);

      if (isSavedWatchlist) {
        final remove = await removeWatchlist.execute(movieDetail);

        remove.fold(
          (failure) async {},
          (successMessage) async {
            emit(OnChangeAddedToWatchlist(false));
          },
        );
        return;
      }

      final save = await saveWatchlist.execute(movieDetail);
      save.fold(
        (failure) async {},
        (successMessage) async {
          emit(OnChangeAddedToWatchlist(true));
        },
      );
      return;
    });

    on<OnChangeWatchlistTv>((event, emit) async {
      final isSavedWatchlist = await getWatchListStatus.execute(event.tvId);

      if (isSavedWatchlist) {
        final remove = await removeWatchlistTv.execute(event.tvDetail);

        remove.fold(
          (failure) async {},
          (successMessage) async {
            emit(OnChangeAddedToWatchlist(false));
          },
        );
        return;
      }

      final save = await saveWatchListTv.execute(event.tvDetail);
      save.fold(
        (failure) async {},
        (successMessage) async {
          emit(OnChangeAddedToWatchlist(true));
        },
      );
      return;
    });
  }
}
