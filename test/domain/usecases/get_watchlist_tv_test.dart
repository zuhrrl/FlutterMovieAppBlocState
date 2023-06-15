import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';
import 'package:ditonton/domain/usecases/get_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'get_watchlist_tv_test.mocks.dart';

@GenerateMocks([TvRepository])
void main() {
  late GetWatchlist usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetWatchlist(mockTvRepository);
  });

  test('should get list of tv from the repository', () async {
    // arrange
    when(mockTvRepository.getWatchlist())
        .thenAnswer((_) async => Right(testWatchlistList));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(testWatchlistList));
  });
}
