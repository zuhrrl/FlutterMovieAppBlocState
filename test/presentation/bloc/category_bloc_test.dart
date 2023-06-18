import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/category_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CategoryBloc categoryBloc;
  setUp(() {
    categoryBloc = CategoryBloc();
  });

  test('initial state should be initial state', () {
    expect(categoryBloc.state, CategoryInitial());
  });

  group('should select category tv', () {
    final selectedCategory = 'tvs';
    blocTest<CategoryBloc, CategoryState>(
      'should get data from the usecase',
      build: () {
        return categoryBloc;
      },
      act: (bloc) => bloc.add(onCategoryChanged(selectedCategory)),
      wait: const Duration(milliseconds: 100),
      expect: () => [SelectedCategory(selectedCategory)],
    );
  });
}
