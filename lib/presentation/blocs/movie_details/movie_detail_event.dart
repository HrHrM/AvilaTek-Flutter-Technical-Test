part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadMovieDetail extends MovieDetailEvent {
  final Movie movie;

  LoadMovieDetail(this.movie);

  @override
  List<Object> get props => [movie];
}
