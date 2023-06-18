import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:equatable/equatable.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetMovieDetail getMovieDetail;
  final GetMovieRecommendations getMovieRecommendations;
  final GetWatchListStatus getWatchListStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;

  MovieDetailBloc(this.getMovieDetail, this.getMovieRecommendations,
      this.getWatchListStatus, this.saveWatchlist, this.removeWatchlist)
      : super(MovieDetailEmpty()) {
    on<OnFetchDetailMovie>(
      (event, emit) async {
        final int movieId = event.movieId;

        emit(MovieDetailLoading());

        final detailResult = await getMovieDetail.execute(movieId);

        detailResult.fold(
          (failure) {
            emit(MovieDetailError(failure.message));
          },
          (detail) async {
            emit(MovieDetailHasData(detail));
          },
        );
      },
    );
  }
}
