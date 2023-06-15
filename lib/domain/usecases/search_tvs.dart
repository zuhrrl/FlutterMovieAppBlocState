import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/search_result.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class SearchTvs {
  final TvRepository repository;

  SearchTvs(this.repository);

  Future<Either<Failure, List<SearchResult>>> execute(String query) {
    return repository.searchTvs(query);
  }
}
