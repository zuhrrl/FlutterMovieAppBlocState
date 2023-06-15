import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/get_now_airing_tvs.dart';
import 'package:equatable/equatable.dart';

part 'now_playing_tv_event.dart';
part 'now_playing_tv_state.dart';

class NowPlayingTvBloc extends Bloc<NowPlayingTvEvent, NowPlayingTvState> {
  final GetNowAiringTvs getNowAiringTvs;

  NowPlayingTvBloc(this.getNowAiringTvs) : super(NowPlayingTvInitial()) {
    on<onFetchNowPlayingTvs>((event, emit) async {
      emit(NowPlayingTvLoading());

      final nowAiringTvs = await getNowAiringTvs.execute();

      nowAiringTvs.fold(
        (failure) {
          emit(NowPlayingTvError(failure.message));
        },
        (tvs) {
          emit(NowPlayingTvHasData(tvs));
        },
      );
    });
  }
}
