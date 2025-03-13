import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_avilatek/core/network/api_client.dart';
import 'package:flutter_test_avilatek/data/repos/movie_repo.dart';
import 'package:flutter_test_avilatek/presentation/blocs/movies/movies_bloc.dart';
import 'package:flutter_test_avilatek/presentation/screens/movies/movies_screen.dart';
import 'package:flutter_test_avilatek/theme/theme.dart';

void main() {
  final movieRepository = MovieRepository(ApiClient());

  runApp(MyApp(movieRepository: movieRepository));
}

class MyApp extends StatelessWidget {
  final MovieRepository movieRepository;

  const MyApp({super.key, required this.movieRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MoviesBloc(movieRepository)..add(LoadMovies()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        title: 'TMDB App',
        initialRoute: '/popular',
        routes: {'/popular': (context) => const MoviesScreen()},
      ),
    );
  }
}
