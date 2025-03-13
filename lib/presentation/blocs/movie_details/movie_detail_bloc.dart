import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_avilatek/data/repos/movie_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_avilatek/data/models/movie.dart';
import 'package:flutter_test_avilatek/data/models/actor.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieRepository movieRepository;

  MovieDetailBloc(this.movieRepository) : super(MovieDetailLoading()) {
    on<LoadMovieDetail>(_onLoadMovieDetail);
  }

  void _onLoadMovieDetail(
    LoadMovieDetail event,
    Emitter<MovieDetailState> emit,
  ) async {
    try {
      final actors = await movieRepository.fetchMovieActors(event.movie.id);
      emit(MovieDetailLoaded(event.movie, actors));
    } catch (_) {
      emit(MovieDetailError());
    }
  }
}
