import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/get_tv_recommendations.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

part 'recommendations_event.dart';
part 'recommendations_state.dart';

class RecommendationsBloc
    extends Bloc<RecommendationsEvent, RecommendationsState> {
  final GetMovieRecommendations getMovieRecommendations;
  final GetTvRecommendations getTvRecommendations;

  RecommendationsBloc(this.getMovieRecommendations, this.getTvRecommendations)
      : super(RecommendationsEmpty()) {
    on<OnFetchRecommendation>((event, emit) async {
      final int movieId = event.movieId;

      emit(RecommendationsLoading());

      final recommendations = await getMovieRecommendations.execute(movieId);

      recommendations.fold(
        (failure) {
          emit(RecommendationsError(failure.message));
        },
        (recommendations) {
          Logger().d('have data $recommendations');
          emit(RecommendationsHasData(recommendations));
        },
      );
    });

    on<OnFetchTvRecommendation>((event, emit) async {
      emit(RecommendationsLoading());

      final recommendations = await getTvRecommendations.execute(event.tvId);

      recommendations.fold(
        (failure) {
          emit(RecommendationsError(failure.message));
        },
        (recommendations) {
          Logger().d('have data $recommendations');
          emit(RecommendationsHasTvData(recommendations));
        },
      );
    });
  }
}
