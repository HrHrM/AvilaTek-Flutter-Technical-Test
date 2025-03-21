import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor.freezed.dart';
part 'actor.g.dart';

@freezed
class Actor with _$Actor {
  factory Actor({
    required int id,
    required String name,
    @JsonKey(name: "profile_path") String? profilePath,
    @JsonKey(name: "biography") String? biography,
    @JsonKey(name: "movie_credits", defaultValue: {})
    Map<String, dynamic>? movieCredits,
    @JsonKey(name: "cast", defaultValue: [])
    List<Map<String, dynamic>>? knownFor,
  }) = _Actor;

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
}
