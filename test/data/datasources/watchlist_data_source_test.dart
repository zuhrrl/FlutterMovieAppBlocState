import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/watchlist_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late WatchlistDataSource dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = WatchlistDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlistTv(testTvTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.insertWatchlist(testTvTable, 'tvs');
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlistTv(testTvTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.insertWatchlist(testTvTable, 'tvs');
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist tv', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlistTv(testTvTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.removeWatchlist(testTvTable, 'tvs');
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlistTv(testTvTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchlist(testTvTable, 'tvs');
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Tv Detail By Id', () {
    final tId = 1;

    test('should return Tv Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getTvById(tId))
          .thenAnswer((_) async => testTvMap);
      // act
      final result = await dataSource.getWatchlistById(tId, 'tvs');
      // assert
      expect(result, testTvTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getTvById(tId)).thenAnswer((_) async => null);
      // act
      final result = await dataSource.getWatchlistById(tId, 'tvs');
      // assert
      expect(result, null);
    });
  });

  group('get watchlist tvs', () {
    test('should return list of TvTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistTvs())
          .thenAnswer((_) async => [testTvMap]);
      // act
      final result = await dataSource.getWatchlist();
      // assert
      expect(result, [testTvTable]);
    });
  });
}
