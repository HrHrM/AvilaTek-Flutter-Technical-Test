import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_avilatek/data/repos/movie_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_avilatek/data/models/movie.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MovieRepository movieRepository;

  MoviesBloc(this.movieRepository) : super(MoviesLoading()) {
    on<LoadMovies>(_onLoadMovies);
  }

  void _onLoadMovies(LoadMovies event, Emitter<MoviesState> emit) async {
    try {
      final movies = await movieRepository.fetchPopularMovies();
      emit(MoviesLoaded(movies));
    } catch (e) {
      emit(MoviesError('Failed to fetch movies: ${e.toString()}'));
    }
  }
}
