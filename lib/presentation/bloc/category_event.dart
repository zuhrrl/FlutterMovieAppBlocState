part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class onCategoryChanged extends CategoryEvent {
  String category = 'movies';

  onCategoryChanged(this.category);
  @override
  List<Object> get props => [category];
}