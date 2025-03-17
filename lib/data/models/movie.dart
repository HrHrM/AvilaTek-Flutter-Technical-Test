import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  factory Movie({
    required int id,
    @Default('No Title') String title,
    @JsonKey(name: "vote_average")
    @Default(0.0)
    double voteAverage,
    @JsonKey(name: "poster_path")
    @Default('')
    String posterPath,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
