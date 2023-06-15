import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/search_result.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/search_tvs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'get_watchlist_tv_test.mocks.dart';

void main() {
  late SearchTvs usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = SearchTvs(mockTvRepository);
  });

  final tSearchResult = <SearchResult>[];
  final tQuery = 'Spiderman';

  test('should get list of tvs from the repository', () async {
    // arrange
    when(mockTvRepository.searchTvs(tQuery))
        .thenAnswer((_) async => Right(tSearchResult));
    // act
    final result = await usecase.execute(tQuery);
    // assert
    expect(result, Right(tSearchResult));
  });
}
