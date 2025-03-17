// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'actor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Actor _$ActorFromJson(Map<String, dynamic> json) {
  return _Actor.fromJson(json);
}

/// @nodoc
mixin _$Actor {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_path")
  String? get profilePath => throw _privateConstructorUsedError;
  @JsonKey(name: "biography")
  String? get biography => throw _privateConstructorUsedError;
  @JsonKey(name: "movie_credits", defaultValue: {})
  Map<String, dynamic>? get movieCredits => throw _privateConstructorUsedError;
  @JsonKey(name: "cast", defaultValue: [])
  List<Map<String, dynamic>>? get knownFor =>
      throw _privateConstructorUsedError;

  /// Serializes this Actor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActorCopyWith<Actor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActorCopyWith<$Res> {
  factory $ActorCopyWith(Actor value, $Res Function(Actor) then) =
      _$ActorCopyWithImpl<$Res, Actor>;
  @useResult
  $Res call({
    int id,
    String name,
    @JsonKey(name: "profile_path") String? profilePath,
    @JsonKey(name: "biography") String? biography,
    @JsonKey(name: "movie_credits", defaultValue: {})
    Map<String, dynamic>? movieCredits,
    @JsonKey(name: "cast", defaultValue: [])
    List<Map<String, dynamic>>? knownFor,
  });
}

/// @nodoc
class _$ActorCopyWithImpl<$Res, $Val extends Actor>
    implements $ActorCopyWith<$Res> {
  _$ActorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profilePath = freezed,
    Object? biography = freezed,
    Object? movieCredits = freezed,
    Object? knownFor = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            profilePath:
                freezed == profilePath
                    ? _value.profilePath
                    : profilePath // ignore: cast_nullable_to_non_nullable
                        as String?,
            biography:
                freezed == biography
                    ? _value.biography
                    : biography // ignore: cast_nullable_to_non_nullable
                        as String?,
            movieCredits:
                freezed == movieCredits
                    ? _value.movieCredits
                    : movieCredits // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>?,
            knownFor:
                freezed == knownFor
                    ? _value.knownFor
                    : knownFor // ignore: cast_nullable_to_non_nullable
                        as List<Map<String, dynamic>>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ActorImplCopyWith<$Res> implements $ActorCopyWith<$Res> {
  factory _$$ActorImplCopyWith(
    _$ActorImpl value,
    $Res Function(_$ActorImpl) then,
  ) = __$$ActorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    @JsonKey(name: "profile_path") String? profilePath,
    @JsonKey(name: "biography") String? biography,
    @JsonKey(name: "movie_credits", defaultValue: {})
    Map<String, dynamic>? movieCredits,
    @JsonKey(name: "cast", defaultValue: [])
    List<Map<String, dynamic>>? knownFor,
  });
}

/// @nodoc
class __$$ActorImplCopyWithImpl<$Res>
    extends _$ActorCopyWithImpl<$Res, _$ActorImpl>
    implements _$$ActorImplCopyWith<$Res> {
  __$$ActorImplCopyWithImpl(
    _$ActorImpl _value,
    $Res Function(_$ActorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profilePath = freezed,
    Object? biography = freezed,
    Object? movieCredits = freezed,
    Object? knownFor = freezed,
  }) {
    return _then(
      _$ActorImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        profilePath:
            freezed == profilePath
                ? _value.profilePath
                : profilePath // ignore: cast_nullable_to_non_nullable
                    as String?,
        biography:
            freezed == biography
                ? _value.biography
                : biography // ignore: cast_nullable_to_non_nullable
                    as String?,
        movieCredits:
            freezed == movieCredits
                ? _value._movieCredits
                : movieCredits // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>?,
        knownFor:
            freezed == knownFor
                ? _value._knownFor
                : knownFor // ignore: cast_nullable_to_non_nullable
                    as List<Map<String, dynamic>>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ActorImpl implements _Actor {
  _$ActorImpl({
    required this.id,
    required this.name,
    @JsonKey(name: "profile_path") this.profilePath,
    @JsonKey(name: "biography") this.biography,
    @JsonKey(name: "movie_credits", defaultValue: {})
    final Map<String, dynamic>? movieCredits,
    @JsonKey(name: "cast", defaultValue: [])
    final List<Map<String, dynamic>>? knownFor,
  }) : _movieCredits = movieCredits,
       _knownFor = knownFor;

  factory _$ActorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActorImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: "profile_path")
  final String? profilePath;
  @override
  @JsonKey(name: "biography")
  final String? biography;
  final Map<String, dynamic>? _movieCredits;
  @override
  @JsonKey(name: "movie_credits", defaultValue: {})
  Map<String, dynamic>? get movieCredits {
    final value = _movieCredits;
    if (value == null) return null;
    if (_movieCredits is EqualUnmodifiableMapView) return _movieCredits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<Map<String, dynamic>>? _knownFor;
  @override
  @JsonKey(name: "cast", defaultValue: [])
  List<Map<String, dynamic>>? get knownFor {
    final value = _knownFor;
    if (value == null) return null;
    if (_knownFor is EqualUnmodifiableListView) return _knownFor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Actor(id: $id, name: $name, profilePath: $profilePath, biography: $biography, movieCredits: $movieCredits, knownFor: $knownFor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath) &&
            (identical(other.biography, biography) ||
                other.biography == biography) &&
            const DeepCollectionEquality().equals(
              other._movieCredits,
              _movieCredits,
            ) &&
            const DeepCollectionEquality().equals(other._knownFor, _knownFor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    profilePath,
    biography,
    const DeepCollectionEquality().hash(_movieCredits),
    const DeepCollectionEquality().hash(_knownFor),
  );

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActorImplCopyWith<_$ActorImpl> get copyWith =>
      __$$ActorImplCopyWithImpl<_$ActorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActorImplToJson(this);
  }
}

abstract class _Actor implements Actor {
  factory _Actor({
    required final int id,
    required final String name,
    @JsonKey(name: "profile_path") final String? profilePath,
    @JsonKey(name: "biography") final String? biography,
    @JsonKey(name: "movie_credits", defaultValue: {})
    final Map<String, dynamic>? movieCredits,
    @JsonKey(name: "cast", defaultValue: [])
    final List<Map<String, dynamic>>? knownFor,
  }) = _$ActorImpl;

  factory _Actor.fromJson(Map<String, dynamic> json) = _$ActorImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: "profile_path")
  String? get profilePath;
  @override
  @JsonKey(name: "biography")
  String? get biography;
  @override
  @JsonKey(name: "movie_credits", defaultValue: {})
  Map<String, dynamic>? get movieCredits;
  @override
  @JsonKey(name: "cast", defaultValue: [])
  List<Map<String, dynamic>>? get knownFor;

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActorImplCopyWith<_$ActorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
