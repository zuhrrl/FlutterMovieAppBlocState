import 'package:ditonton/presentation/widgets/tv_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: Scaffold(body: body),
    );
  }

  testWidgets('tv card widget should available', (WidgetTester tester) async {
    await tester.pumpWidget(_makeTestableWidget(TvCard(testTv)));
    var tvTitle = find.byKey(Key('title'));

    expect(tvTitle, findsOneWidget);
  });
}
