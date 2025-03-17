// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String? ?? 'No Title',
  voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
  posterPath: json['poster_path'] as String? ?? '',
);

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'poster_path': instance.posterPath,
    };
