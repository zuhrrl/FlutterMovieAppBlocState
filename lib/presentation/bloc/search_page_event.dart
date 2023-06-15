part of 'search_page_bloc.dart';

abstract class SearchPageEvent extends Equatable {
  const SearchPageEvent();

  @override
  List<Object> get props => [];
}

class OnQueryChanged extends SearchPageEvent {
  final String query;
  final String searchType;

  OnQueryChanged(this.searchType, this.query);

  @override
  List<Object> get props => [query];
}
