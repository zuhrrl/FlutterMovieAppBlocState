import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/movie_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/recommendations_bloc.dart';
import 'package:ditonton/presentation/bloc/save_watch_list_bloc.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_detai_page_test.mocks.dart';

@GenerateMocks([MovieDetailBloc, SaveWatchListBloc, RecommendationsBloc])
void main() {
  late MockMovieDetailBloc mockMovieDetailBloc;
  late MockSaveWatchListBloc mockSaveWatchListBloc;
  late MockRecommendationsBloc mockRecommendationsBloc;

  setUp(() {
    mockMovieDetailBloc = MockMovieDetailBloc();
    mockSaveWatchListBloc = MockSaveWatchListBloc();
    mockRecommendationsBloc = MockRecommendationsBloc();
  });

  Widget _makeTestableWidget({required Widget body}) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MovieDetailBloc>(
            create: (_) => mockMovieDetailBloc,
          ),
          BlocProvider<SaveWatchListBloc>(
            create: (_) => mockSaveWatchListBloc,
          ),
          BlocProvider<RecommendationsBloc>(
            create: (_) => mockRecommendationsBloc,
          ),
        ],
        child: MaterialApp(
          home: body,
        ));
  }

  testWidgets('test loading should return loading progress bar',
      (WidgetTester tester) async {
    // arrange
    when(mockMovieDetailBloc.state).thenReturn(MovieDetailLoading());
    when(
      mockMovieDetailBloc.stream,
    ).thenAnswer((realInvocation) => Stream.fromIterable([
          MovieDetailLoading(),
        ]));

    when(mockRecommendationsBloc.state).thenReturn(RecommendationsLoading());
    when(
      mockRecommendationsBloc.stream,
    ).thenAnswer((realInvocation) => Stream.fromIterable([
          RecommendationsLoading(),
        ]));

    when(mockSaveWatchListBloc.state)
        .thenReturn(OnChangeAddedToWatchlist(true));
    when(
      mockSaveWatchListBloc.stream,
    ).thenAnswer((realInvocation) => Stream.fromIterable([
          OnChangeAddedToWatchlist(true),
        ]));
    // act
    await tester.pumpWidget(_makeTestableWidget(body: MovieDetailPage(id: 1)));
    final progressFinder = find.byType(CircularProgressIndicator);

    // assert
    expect(progressFinder, findsOneWidget);
  });

  testWidgets('test get movie details is gotten successfully',
      (WidgetTester tester) async {
    // arrange
    when(mockMovieDetailBloc.state)
        .thenReturn(MovieDetailHasData(testMovieDetail));
    when(
      mockMovieDetailBloc.stream,
    ).thenAnswer((realInvocation) => Stream.fromIterable([
          MovieDetailHasData(testMovieDetail),
        ]));

    when(mockRecommendationsBloc.state)
        .thenReturn(RecommendationsHasData([testMovie]));
    when(
      mockRecommendationsBloc.stream,
    ).thenAnswer((realInvocation) => Stream.fromIterable([
          RecommendationsHasData([testMovie]),
        ]));

    when(mockSaveWatchListBloc.state)
        .thenReturn(OnChangeAddedToWatchlist(true));
    when(
      mockSaveWatchListBloc.stream,
    ).thenAnswer((realInvocation) => Stream.fromIterable([
          OnChangeAddedToWatchlist(true),
        ]));
    // act
    await tester.pumpWidget(_makeTestableWidget(body: MovieDetailPage(id: 1)));
    final recommendationWidget = find.byKey(Key('recommendations_widget'));

    // assert
    expect(recommendationWidget, findsOneWidget);
  });
}
