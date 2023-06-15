import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/search_result.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/domain/usecases/search_tvs.dart';
import 'package:ditonton/presentation/bloc/search_page_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_page_block_test.mocks.dart';

@GenerateMocks([SearchMovies, SearchTvs])
void main() {
  late SearchPageBloc searchPageBloc;
  late MockSearchMovies mockSearchMovies;
  late MockSearchTvs mockSearchTvs;

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    mockSearchTvs = MockSearchTvs();
    searchPageBloc = SearchPageBloc(mockSearchMovies, mockSearchTvs);
  });

  final searchResultFake = SearchResult(
    isMovie: true,
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );
  final tSearchResult = <SearchResult>[searchResultFake];
  final tQuery = 'spiderman';

  test('initial state should be empty', () {
    expect(searchPageBloc.state, SearchEmpty());
  });

  group('bloc test', () {
    blocTest<SearchPageBloc, SearchPageState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockSearchMovies.execute(tQuery))
            .thenAnswer((_) async => Right(tSearchResult));
        return searchPageBloc;
      },
      act: (bloc) => bloc.add(OnQueryChanged('movies', tQuery)),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        SearchLoading(),
        SearchHasData(tSearchResult),
      ],
      verify: (bloc) {
        verify(mockSearchMovies.execute(tQuery));
      },
    );
    blocTest<SearchPageBloc, SearchPageState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockSearchMovies.execute(tQuery))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return searchPageBloc;
      },
      act: (bloc) => bloc.add(OnQueryChanged('movies', tQuery)),
      expect: () => [
        SearchLoading(),
        SearchError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockSearchMovies.execute(tQuery));
      },
    );
  });
}
