part of 'search_page_bloc.dart';

abstract class SearchPageState extends Equatable {
  const SearchPageState();

  @override
  List<Object> get props => [];
}

class SearchPageInitial extends SearchPageState {}

class SearchEmpty extends SearchPageState {}

class SearchLoading extends SearchPageState {}

class SearchError extends SearchPageState {
  final String message;

  SearchError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchHasData extends SearchPageState {
  final List<SearchResult> result;

  SearchHasData(this.result);

  @override
  List<Object> get props => [result];
}
