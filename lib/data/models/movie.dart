import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  factory Movie({
    required int id,
    required String title,
    @JsonKey(name: "vote_average") required double voteAverage,
    @JsonKey(name: "poster_path") required String posterPath,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
