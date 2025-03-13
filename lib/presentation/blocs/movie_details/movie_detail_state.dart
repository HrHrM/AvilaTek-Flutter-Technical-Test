part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final Movie movie;
  final List<Actor> actors;

  MovieDetailLoaded(this.movie, this.actors);

  @override
  List<Object> get props => [movie, actors];
}

class MovieDetailError extends MovieDetailState {}
