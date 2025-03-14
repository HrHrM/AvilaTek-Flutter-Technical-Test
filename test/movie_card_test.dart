import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_avilatek/presentation/widgets/movie_card.dart';

void main() {
  testWidgets('TEST: MovieCard renders correctly with title and score', (
    WidgetTester tester,
  ) async {
    final mockMovie = {
      'id': 1,
      'title': 'Test Movie',
      'poster_path': null,
      'vote_average': 7.5,
    };

    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: MovieCard(movie: mockMovie, index: 0))),
    );

    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Test Movie'), findsOneWidget);

    expect(find.text('75% User Score'), findsOneWidget);

    expect(find.byType(Hero), findsOneWidget);
  });
}
