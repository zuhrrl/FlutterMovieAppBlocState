import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_recommendations.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/remove_watchlist_tv.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist_tv.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

part 'tv_detail_event.dart';
part 'tv_detail_state.dart';

class TvDetailBloc extends Bloc<TvDetailEvent, TvDetailState> {
  final GetTvDetail getTvDetail;
  final GetTvRecommendations getTvRecommendations;
  final GetWatchListStatus getWatchListStatus;
  final SaveWatchListTv saveWatchlist;
  final RemoveWatchlistTv removeWatchlist;
  TvDetailBloc(this.getTvDetail, this.getTvRecommendations,
      this.getWatchListStatus, this.saveWatchlist, this.removeWatchlist)
      : super(TvDetailInitial()) {
    on<OnFetchDetailTv>((event, emit) async {
      emit(TvDetailLoading());

      final detailResult = await getTvDetail.execute(event.tvId);

      detailResult.fold(
        (failure) {
          emit(TvDetailError(failure.message));
        },
        (detail) {
          emit(TvDetailHasData(detail));
        },
      );
    });

    on<OnFetchRecommendation>(
      (event, emit) async {
        final recommendations = await getTvRecommendations.execute(event.tvId);

        recommendations.fold(
          (failure) {
            // emit(RecommendationsError(failure.message));
          },
          (recommendations) {
            // Logger().d('recommendations has data ${recommendations}');
            emit(TvRecommendationsHasData(recommendations));
          },
        );
      },
    );

    // on<OnInitWatchlistTv>(
    //   (event, emit) async {
    //     final isSavedWatchlist = await getWatchListStatus.execute(event.tvId);
    //     if (isSavedWatchlist) {
    //       return emit(OnChangeAddedToWatchlist(true));
    //     }
    //     return emit(OnChangeAddedToWatchlist(false));
    //   },
    // );
    // on<OnChangeWatchlistTv>((event, emit) async {
    //   final int tvId = event.tvId;
    //   final TvDetail tvDetail = event.tvDetail;

    //   final isSavedWatchlist = await getWatchListStatus.execute(tvId);

    //   if (isSavedWatchlist) {
    //     final remove = await removeWatchlist.execute(tvDetail);

    //     remove.fold(
    //       (failure) async {},
    //       (successMessage) async {
    //         emit(OnChangeAddedToWatchlist(false));
    //       },
    //     );
    //     return;
    //   }

    //   final save = await saveWatchlist.execute(tvDetail);
    //   save.fold(
    //     (failure) async {},
    //     (successMessage) async {
    //       emit(OnChangeAddedToWatchlist(true));
    //     },
    //   );
    //   return;
    // });
  }
}
