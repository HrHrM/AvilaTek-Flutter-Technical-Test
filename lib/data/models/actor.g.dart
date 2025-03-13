// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActorImpl _$$ActorImplFromJson(Map<String, dynamic> json) => _$ActorImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  profilePath: json['profile_path'] as String?,
  biography: json['biography'] as String?,
  movieCredits: json['movie_credits'] as Map<String, dynamic>? ?? {},
  knownFor:
      (json['cast'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      [],
);

Map<String, dynamic> _$$ActorImplToJson(_$ActorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'biography': instance.biography,
      'movie_credits': instance.movieCredits,
      'cast': instance.knownFor,
    };
