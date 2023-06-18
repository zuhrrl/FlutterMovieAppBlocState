import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/models/tv_table.dart';

abstract class WatchlistDataSource {
  Future<String> insertWatchlist(dynamic item, String type);
  Future<String> removeWatchlist(dynamic item, String type);
  Future<TvTable?> getWatchlistById(int id, String type);
  Future<List<TvTable>> getWatchlist();
}

class WatchlistDataSourceImpl implements WatchlistDataSource {
  final DatabaseHelper databaseHelper;

  WatchlistDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchlist(dynamic tv, String type) async {
    try {
      if (type == 'movies') {
        await databaseHelper.insertWatchlist(tv);
        return 'Added to Watchlist';
      }
      await databaseHelper.insertWatchlistTv(tv);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlist(dynamic item, String type) async {
    try {
      if (type == 'movies') {
        await databaseHelper.removeWatchlist(item);
        return 'Removed from Watchlist';
      }
      await databaseHelper.removeWatchlistTv(item);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<TvTable>> getWatchlist() async {
    final result = await databaseHelper.getWatchlistTvs();
    return result.map((data) => TvTable.fromMap(data)).toList();
  }

  @override
  Future<TvTable?> getWatchlistById(int id, String type) async {
    final result = await databaseHelper.getTvById(id);
    if (result != null) {
      return TvTable.fromMap(result);
    } else {
      return null;
    }
  }
}
