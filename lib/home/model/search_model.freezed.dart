// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchModel {
  String get query => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  FilterSearchType get filterSearchType => throw _privateConstructorUsedError;

  /// Create a copy of SearchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchModelCopyWith<SearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchModelCopyWith<$Res> {
  factory $SearchModelCopyWith(
          SearchModel value, $Res Function(SearchModel) then) =
      _$SearchModelCopyWithImpl<$Res, SearchModel>;
  @useResult
  $Res call(
      {String query, bool isSearching, FilterSearchType filterSearchType});
}

/// @nodoc
class _$SearchModelCopyWithImpl<$Res, $Val extends SearchModel>
    implements $SearchModelCopyWith<$Res> {
  _$SearchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? isSearching = null,
    Object? filterSearchType = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      filterSearchType: null == filterSearchType
          ? _value.filterSearchType
          : filterSearchType // ignore: cast_nullable_to_non_nullable
              as FilterSearchType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchModelImplCopyWith<$Res>
    implements $SearchModelCopyWith<$Res> {
  factory _$$SearchModelImplCopyWith(
          _$SearchModelImpl value, $Res Function(_$SearchModelImpl) then) =
      __$$SearchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String query, bool isSearching, FilterSearchType filterSearchType});
}

/// @nodoc
class __$$SearchModelImplCopyWithImpl<$Res>
    extends _$SearchModelCopyWithImpl<$Res, _$SearchModelImpl>
    implements _$$SearchModelImplCopyWith<$Res> {
  __$$SearchModelImplCopyWithImpl(
      _$SearchModelImpl _value, $Res Function(_$SearchModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? isSearching = null,
    Object? filterSearchType = null,
  }) {
    return _then(_$SearchModelImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      filterSearchType: null == filterSearchType
          ? _value.filterSearchType
          : filterSearchType // ignore: cast_nullable_to_non_nullable
              as FilterSearchType,
    ));
  }
}

/// @nodoc

class _$SearchModelImpl implements _SearchModel {
  const _$SearchModelImpl(
      {required this.query,
      required this.isSearching,
      required this.filterSearchType});

  @override
  final String query;
  @override
  final bool isSearching;
  @override
  final FilterSearchType filterSearchType;

  @override
  String toString() {
    return 'SearchModel(query: $query, isSearching: $isSearching, filterSearchType: $filterSearchType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchModelImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.filterSearchType, filterSearchType) ||
                other.filterSearchType == filterSearchType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, query, isSearching, filterSearchType);

  /// Create a copy of SearchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchModelImplCopyWith<_$SearchModelImpl> get copyWith =>
      __$$SearchModelImplCopyWithImpl<_$SearchModelImpl>(this, _$identity);
}

abstract class _SearchModel implements SearchModel {
  const factory _SearchModel(
      {required final String query,
      required final bool isSearching,
      required final FilterSearchType filterSearchType}) = _$SearchModelImpl;

  @override
  String get query;
  @override
  bool get isSearching;
  @override
  FilterSearchType get filterSearchType;

  /// Create a copy of SearchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchModelImplCopyWith<_$SearchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
