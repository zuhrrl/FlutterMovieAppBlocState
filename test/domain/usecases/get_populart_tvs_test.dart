import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/get_popular_tvs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'get_watchlist_tv_test.mocks.dart';

void main() {
  late GetPopularTvs usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetPopularTvs(mockTvRepository);
  });

  final tTvs = <Tv>[];

  group('GetPopularTvs Tests', () {
    group('execute', () {
      test(
          'should get list of tvs from the repository when execute function is called',
          () async {
        // arrange
        when(mockTvRepository.getPopularTvs())
            .thenAnswer((_) async => Right(tTvs));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tTvs));
      });
    });
  });
}
