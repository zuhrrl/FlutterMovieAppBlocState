import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/get_tv_detail.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist_tv.dart';
import 'package:ditonton/domain/usecases/save_watchlist_tv.dart';
import 'package:ditonton/presentation/bloc/save_watch_list_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'recommendation_bloc_test.mocks.dart';
import 'tv_detail_bloc_test.mocks.dart';

@GenerateMocks([
  GetTvDetail,
  GetMovieRecommendations,
  GetWatchListStatus,
  SaveWatchListTv,
  RemoveWatchlistTv
])
void main() {
  late TvDetailBloc tvDetailBloc;
  late MockGetTvDetail mockGetTvDetail;
  late MockGetTvRecommendations mockGetTvRecommendations;
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockSaveWatchListTv mockSaveWatchListTv;
  late MockRemoveWatchlistTv mockRemoveWatchlistTv;
  final tvId = 1;

  setUp(() {
    mockGetTvDetail = MockGetTvDetail();
    mockGetTvRecommendations = MockGetTvRecommendations();
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockRemoveWatchlistTv = MockRemoveWatchlistTv();
    mockSaveWatchListTv = MockSaveWatchListTv();

    tvDetailBloc = TvDetailBloc(mockGetTvDetail, mockGetTvRecommendations,
        mockGetWatchListStatus, mockSaveWatchListTv, mockRemoveWatchlistTv);
  });

  final tId = 1;

  test('initial state should be empty', () {
    expect(tvDetailBloc.state, TvDetailInitial());
  });

  group('Get Tv Detail', () {
    final tvId = 1;
    blocTest<TvDetailBloc, TvDetailState>(
      'should get data from the usecase',
      build: () {
        when(mockGetTvDetail.execute(tvId))
            .thenAnswer((_) async => Right(testTvDetail));
        when(mockGetTvRecommendations.execute(tvId))
            .thenAnswer((_) async => Right([testTv]));
        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(OnFetchDetailTv(tvId)),
      wait: const Duration(milliseconds: 100),
      verify: (bloc) {
        verify(mockGetTvDetail.execute(tvId));
      },
    );

    blocTest<TvDetailBloc, TvDetailState>(
      'should show loading and return tvdetail and recommendation when execute onFetchDetailTv',
      build: () {
        when(mockGetTvDetail.execute(tvId))
            .thenAnswer((_) async => Right(testTvDetail));
        when(mockGetTvRecommendations.execute(tvId))
            .thenAnswer((_) async => Right([testTv]));
        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(OnFetchDetailTv(tvId)),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TvDetailLoading(),
        TvDetailHasData(testTvDetail),
        // TvRecommendationsHasData([testTv])
      ],
      verify: (bloc) {
        verify(mockGetTvDetail.execute(tvId));
      },
    );

    blocTest<TvDetailBloc, TvDetailState>(
      'should show error when fetch movie detail failed',
      build: () {
        when(mockGetTvDetail.execute(tId))
            .thenAnswer((_) async => Left(ServerFailure('error')));
        when(mockGetTvRecommendations.execute(tvId))
            .thenAnswer((_) async => Left(ServerFailure('error')));
        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(OnFetchDetailTv(tvId)),
      wait: const Duration(milliseconds: 100),
      expect: () => [TvDetailLoading(), TvDetailError('error')],
      verify: (bloc) {
        verify(mockGetTvDetail.execute(tvId));
      },
    );
  });

  group('Watchlist tv', () {
    // blocTest<TvDetailBloc, TvDetailState>(
    //   'verify mock getwatchlist status',
    //   build: () {
    //     when(mockGetWatchListStatus.execute(tvId))
    //         .thenAnswer((_) async => true);
    //     return tvDetailBloc;
    //   },
    //   act: (bloc) => bloc.add(OnInitWatchlistTv(tvId)),
    //   wait: const Duration(milliseconds: 100),
    //   verify: (bloc) {
    //     verify(mockGetWatchListStatus.execute(tvId));
    //   },
    // );

    // blocTest<TvDetailBloc, TvDetailState>(
    //   'verify mock getwatchlist status shoudl return true',
    //   build: () {
    //     when(mockGetWatchListStatus.execute(tvId))
    //         .thenAnswer((_) async => true);
    //     return tvDetailBloc;
    //   },
    //   act: (bloc) => bloc.add(OnInitWatchlistTv(tvId)),
    //   wait: const Duration(milliseconds: 100),
    //   expect: () => [OnChangeAddedToWatchlist(true)],
    //   verify: (bloc) {
    //     verify(mockGetWatchListStatus.execute(tvId));
    //   },
    // );

    // blocTest<TvDetailBloc, TvDetailState>(
    //   'verify mock getwatchlist status shoudl return false',
    //   build: () {
    //     when(mockGetWatchListStatus.execute(tvId))
    //         .thenAnswer((_) async => false);
    //     return tvDetailBloc;
    //   },
    //   act: (bloc) => bloc.add(OnInitWatchlistTv(tvId)),
    //   wait: const Duration(milliseconds: 100),
    //   expect: () => [OnChangeAddedToWatchlist(false)],
    //   verify: (bloc) {
    //     verify(mockGetWatchListStatus.execute(tvId));
    //   },
    // );
  });
}
