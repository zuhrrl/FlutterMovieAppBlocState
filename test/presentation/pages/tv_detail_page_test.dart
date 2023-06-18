import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/presentation/bloc/recommendations_bloc.dart';
import 'package:ditonton/presentation/bloc/save_watch_list_bloc.dart';
import 'package:ditonton/presentation/bloc/search_page_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_detail_bloc.dart';
import 'package:ditonton/presentation/pages/tv_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_detail_page_test.mocks.dart';

@GenerateMocks([TvDetailBloc, SaveWatchListBloc, RecommendationsBloc])
void main() {
  late MockTvDetailBloc mockTvDetailBloc;
  late MockSaveWatchListBloc mockSaveWatchListBloc;
  late MockRecommendationsBloc mockRecommendationsBloc;

  setUp(() {
    mockTvDetailBloc = MockTvDetailBloc();
    mockSaveWatchListBloc = MockSaveWatchListBloc();
    mockRecommendationsBloc = MockRecommendationsBloc();
  });

  Widget _makeTestableWidget({required Widget body}) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TvDetailBloc>(
            create: (_) => mockTvDetailBloc,
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
    when(mockTvDetailBloc.state).thenReturn(TvDetailLoading());
    when(
      mockTvDetailBloc.stream,
    ).thenAnswer((realInvocation) => Stream.fromIterable([
          TvDetailLoading(),
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
    await tester.pumpWidget(_makeTestableWidget(body: TvDetailPage(id: 1)));
    final progressFinder = find.byType(CircularProgressIndicator);

    // assert
    expect(progressFinder, findsOneWidget);
  });

  testWidgets('test get tvdetail is gotten successfully',
      (WidgetTester tester) async {
    // arrange
    when(mockTvDetailBloc.state).thenReturn(TvDetailHasData(testTvDetail));
    when(
      mockTvDetailBloc.stream,
    ).thenAnswer((realInvocation) => Stream.fromIterable([
          TvDetailHasData(testTvDetail),
        ]));

    when(mockRecommendationsBloc.state)
        .thenReturn(RecommendationsHasTvData([testTv]));
    when(
      mockRecommendationsBloc.stream,
    ).thenAnswer((realInvocation) => Stream.fromIterable([
          RecommendationsHasTvData([testTv]),
        ]));

    when(mockSaveWatchListBloc.state)
        .thenReturn(OnChangeAddedToWatchlist(true));
    when(
      mockSaveWatchListBloc.stream,
    ).thenAnswer((realInvocation) => Stream.fromIterable([
          OnChangeAddedToWatchlist(true),
        ]));
    // act
    await tester.pumpWidget(_makeTestableWidget(body: TvDetailPage(id: 1)));
    final recommendationWidget = find.byKey(Key('recommendations_widget'));

    // assert
    expect(recommendationWidget, findsOneWidget);
  });
}
