part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  @override
  List<Object> get props => [];
}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<Movie> movies;

  MoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class MoviesError extends MoviesState {
  final String message;
  MoviesError(this.message);
}
