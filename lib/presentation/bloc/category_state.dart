part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class SelectedCategory extends CategoryState {
  final String category;
  SelectedCategory(this.category);
  @override
  List<Object> get props => [category];
}
