import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/get_tv_recommendations.dart';
import 'package:ditonton/presentation/bloc/recommendations_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'recommendation_bloc_test.mocks.dart';

@GenerateMocks([GetMovieRecommendations, GetTvRecommendations])
void main() {
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetTvRecommendations mockGetTvRecommendations;
  late RecommendationsBloc recommendationsBloc;
  setUp(() {
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetTvRecommendations = MockGetTvRecommendations();
    recommendationsBloc = RecommendationsBloc(
        mockGetMovieRecommendations, mockGetTvRecommendations);
  });

  test('initial state should be initial state', () {
    expect(recommendationsBloc.state, RecommendationsEmpty());
  });

  group('Recommendation Bloc', () {
    final movieId = 1;
    final tvId = 1;
    blocTest<RecommendationsBloc, RecommendationsState>(
      'should return movie recommendations',
      build: () {
        // when(mockGetTvRecommendations.execute(tvId))
        //     .thenAnswer((_) async => Right([testTv]));
        when(mockGetMovieRecommendations.execute(movieId))
            .thenAnswer((_) async => Right([testMovie]));
        return recommendationsBloc;
      },
      act: (bloc) => bloc.add(OnFetchRecommendation(movieId)),
      wait: const Duration(milliseconds: 100),
      verify: (bloc) => verify(mockGetMovieRecommendations.execute(movieId)),
      expect: () => [
        RecommendationsLoading(),
        RecommendationsHasData([testMovie])
      ],
    );

    blocTest<RecommendationsBloc, RecommendationsState>(
      'should return tvs recommendations',
      build: () {
        when(mockGetTvRecommendations.execute(tvId))
            .thenAnswer((_) async => Right([testTv]));

        return recommendationsBloc;
      },
      act: (bloc) => bloc.add(OnFetchTvRecommendation(tvId)),
      wait: const Duration(milliseconds: 100),
      verify: (bloc) => verify(mockGetTvRecommendations.execute(tvId)),
      expect: () => [
        RecommendationsLoading(),
        RecommendationsHasTvData([testTv])
      ],
    );
  });
}
