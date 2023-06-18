import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tvs.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_tvs_event.dart';
part 'top_rated_tvs_state.dart';

class TopRatedTvsBloc extends Bloc<TopRatedTvsEvent, TopRatedTvsState> {
  final GetTopRatedTvs getTopRatedTvs;

  TopRatedTvsBloc(this.getTopRatedTvs) : super(TopRatedTvsInitial()) {
    on<onFetchTopRatedTvs>((event, emit) async {
      emit(TopRatedTvsLoading());

      final topRatedTvs = await getTopRatedTvs.execute();

      topRatedTvs.fold(
        (failure) {
          emit(TopRatedTvsError(failure.message));
        },
        (tvs) {
          emit(TopRatedTvsHasData(tvs));
        },
      );
    });
  }
}
