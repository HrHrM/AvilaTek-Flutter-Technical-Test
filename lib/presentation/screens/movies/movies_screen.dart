import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_test_avilatek/core/network/api_client.dart';
import 'package:flutter_test_avilatek/data/repos/movie_repo.dart';
import 'package:flutter_test_avilatek/presentation/blocs/movie_details/movie_detail_bloc.dart';
import 'package:flutter_test_avilatek/presentation/blocs/movies/movies_bloc.dart';
import 'package:flutter_test_avilatek/presentation/screens/movie_details/movie_detail_screen.dart';
import 'package:flutter_test_avilatek/presentation/widgets/custom_loader.dart';
import 'package:flutter_test_avilatek/presentation/widgets/drawer.dart';
import 'package:flutter_test_avilatek/presentation/widgets/error_text.dart';
import 'package:flutter_test_avilatek/presentation/widgets/movie_card.dart';
import 'package:flutter_test_avilatek/theme/theme.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        toolbarHeight: 115,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(25, 25),
                  backgroundColor: Colors.transparent,
                ),
                child: Ink(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppTheme.primaryGradient,
                  ),
                  child: const Icon(
                    Icons.menu,
                    color: Color(0xFFFFFFFF),
                    size: 25,
                  ),
                ),
              );
            },
          ),
        ),
        title: FadeInDown(
          child: const Text(
            'Latest',
            style: TextStyle(
              fontSize: 26,
              color: Colors.black,
              fontFamily: 'Baloo-Regular',
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoading) {
            return const Center(child: CustomLoader());
          } else if (state is MoviesLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 15,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => BlocProvider(
                                create:
                                    (_) => MovieDetailBloc(
                                      MovieRepository(ApiClient()),
                                    ),
                                child: MovieDetailScreen(movie: movie),
                              ),
                        ),
                      );
                    },
                    child: MovieCard(movie: movie.toJson(), index: index),
                  );
                },
              ),
            );
          } else if (state is MoviesError) {
            print('ERROR: ${state.message}');
            return Center(child: ErrorText(message: state.message));
          } else {
            return ErrorText(message: 'Request Error');
          }
        },
      ),
    );
  }
}
