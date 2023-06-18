import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/search_result.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/domain/usecases/search_tvs.dart';
import 'package:equatable/equatable.dart';

part 'search_page_event.dart';
part 'search_page_state.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  final SearchMovies searchMovies;
  final SearchTvs searchTvs;
  List<SearchResult> _searchResult = [];

  SearchPageBloc(this.searchMovies, this.searchTvs) : super(SearchEmpty()) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;
      final searchType = event.searchType;

      emit(SearchLoading());

      final result = await fetchSearchResult(searchType, query);

      result.fold(
        (failure) {
          emit(SearchError(failure.message));
        },
        (data) {
          _searchResult.clear();
          if (searchType == 'movies') {
            data.forEach((item) => _searchResult.add(SearchResult(
                isMovie: true,
                adult: item.adult,
                backdropPath: item.backdropPath,
                genreIds: item.genreIds,
                id: item.id,
                originalTitle: item.originalTitle,
                overview: item.overview,
                popularity: item.popularity,
                posterPath: item.posterPath,
                releaseDate: item.releaseDate,
                title: item.title,
                video: item.video,
                voteAverage: item.voteAverage,
                voteCount: item.voteCount)));
          }

          if (searchType == 'tvs') {
            data.forEach((item) => _searchResult.add(SearchResult(
                isMovie: false,
                adult: item.adult,
                backdropPath: item.backdropPath,
                genreIds: item.genreIds,
                id: item.id,
                originalTitle: item.originalTitle,
                overview: item.overview,
                popularity: item.popularity,
                posterPath: item.posterPath,
                releaseDate: item.releaseDate,
                title: item.title,
                video: item.video,
                voteAverage: item.voteAverage,
                voteCount: item.voteCount)));
          }
          emit(SearchHasData(_searchResult));
        },
      );
    });
  }

  fetchSearchResult(String searchType, query) async {
    if (searchType == 'movies') {
      return await searchMovies.execute(query);
    }

    return await searchTvs.execute(query);
  }
}
