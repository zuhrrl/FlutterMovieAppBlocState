import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:equatable/equatable.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc(this.getPopularMovies) : super(PopularMoviesInitial()) {
    on<onFetchPopularMovies>((event, emit) async {
      emit(PopularMoviesLoading());

      final popularMovies = await getPopularMovies.execute();

      popularMovies.fold(
        (failure) {
          emit(PopularMoviesError(failure.message));
        },
        (movies) {
          emit(PopularMoviesHasData(movies));
        },
      );
    });
  }
}
