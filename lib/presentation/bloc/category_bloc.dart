import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<onCategoryChanged>((event, emit) async {
      final category = event.category;

      emit(SelectedCategory(category));
    });
  }
}
