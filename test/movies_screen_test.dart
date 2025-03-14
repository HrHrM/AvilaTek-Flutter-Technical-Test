import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_avilatek/core/network/api_client.dart';
import 'package:flutter_test_avilatek/data/models/movie.dart';
import 'package:flutter_test_avilatek/data/repos/movie_repo.dart';
import 'package:flutter_test_avilatek/presentation/blocs/movies/movies_bloc.dart';
import 'package:flutter_test_avilatek/presentation/screens/movie_details/movie_detail_screen.dart';
import 'package:flutter_test_avilatek/presentation/screens/movies/movies_screen.dart';
import 'package:flutter_test_avilatek/presentation/widgets/custom_loader.dart';
import 'package:flutter_test_avilatek/presentation/widgets/error_text.dart';
import 'package:flutter_test_avilatek/presentation/widgets/movie_card.dart';

void main() {
  group('MoviesScreen Widget Tests', () {
    late MoviesBloc moviesBloc;

    setUp(() {
      moviesBloc = MoviesBloc(MovieRepository(ApiClient()));
    });

    testWidgets('TEST: Displays title "Latest"', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: moviesBloc,
            child: const MoviesScreen(),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Latest'), findsOneWidget);
    });

    testWidgets('Shows loading indicator when MoviesLoading state', (
      tester,
    ) async {
      moviesBloc.emit(MoviesLoading());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: moviesBloc,
            child: const MoviesScreen(),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(CustomLoader), findsOneWidget);
    });

    testWidgets('Displays error message when MoviesState is error', (
      tester,
    ) async {
      moviesBloc.emit(MoviesError());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: moviesBloc,
            child: const MoviesScreen(),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(ErrorText), findsOneWidget);
    });

    testWidgets('Navigates to MovieDetailScreen on tap', (tester) async {
      final testMovie = Movie(
        id: 1,
        title: 'Movie A',
        posterPath: '/a.jpg',
        voteAverage: 7.5,
      );

      moviesBloc.emit(MoviesLoaded([testMovie]));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: moviesBloc,
            child: const MoviesScreen(),
          ),
        ),
      );

      await tester.pump();

      await tester.tap(find.byType(MovieCard).first);
      await tester.pumpAndSettle();

      expect(find.byType(MovieDetailScreen), findsOneWidget);
    });
  });
}
