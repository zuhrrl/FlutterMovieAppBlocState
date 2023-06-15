import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:equatable/equatable.dart';

part 'now_playing_movies_event.dart';
part 'now_playing_movies_state.dart';

class NowPlayingMoviesBloc
    extends Bloc<NowPlayingMoviesEvent, NowPlayingMoviesState> {
  final GetNowPlayingMovies getNowPlayingMovies;

  NowPlayingMoviesBloc(this.getNowPlayingMovies)
      : super(NowPlayingMoviesInitial()) {
    on<NowPlayingMoviesEvent>((event, emit) async {
      emit(NowPlayingMoviesLoading());

      final nowPlayingMovies = await getNowPlayingMovies.execute();

      nowPlayingMovies.fold(
        (failure) {
          emit(NowPlayingMoviesError(failure.message));
        },
        (movies) {
          emit(NowPlayingMoviesHasData(movies));
        },
      );
    });
  }
}
