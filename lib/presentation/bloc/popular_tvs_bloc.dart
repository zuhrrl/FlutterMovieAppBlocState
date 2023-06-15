import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/get_popular_tvs.dart';
import 'package:equatable/equatable.dart';

part 'popular_tvs_event.dart';
part 'popular_tvs_state.dart';

class PopularTvsBloc extends Bloc<PopularTvsEvent, PopularTvsState> {
  final GetPopularTvs getPopularTvs;

  PopularTvsBloc(this.getPopularTvs) : super(PopularTvsInitial()) {
    on<onFetchPopularTvs>((event, emit) async {
      emit(PopularTvsLoading());

      final popularTv = await getPopularTvs.execute();

      popularTv.fold(
        (failure) {
          emit(PopularTvsError(failure.message));
        },
        (tvs) {
          emit(PopularTvsHasData(tvs));
        },
      );
    });
  }
}
