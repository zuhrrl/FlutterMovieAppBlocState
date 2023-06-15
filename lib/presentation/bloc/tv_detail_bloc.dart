import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_detail.dart';
import 'package:equatable/equatable.dart';

part 'tv_detail_event.dart';
part 'tv_detail_state.dart';

class TvDetailBloc extends Bloc<TvDetailEvent, TvDetailState> {
  final GetTvDetail getTvDetail;
  TvDetailBloc(this.getTvDetail) : super(TvDetailInitial()) {
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
  }
}
