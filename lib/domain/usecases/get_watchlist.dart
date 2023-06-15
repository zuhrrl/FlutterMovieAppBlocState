import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetWatchlist {
  final TvRepository _repository;

  GetWatchlist(this._repository);

  Future<Either<Failure, List<Watchlist>>> execute() {
    return _repository.getWatchlist();
  }
}
