// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return _CompanyState.fromJson(json);
}

/// @nodoc
mixin _$Company {
  String get company_id => throw _privateConstructorUsedError;
  String get company_name => throw _privateConstructorUsedError;

  /// Serializes this Company to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompanyCopyWith<Company> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyCopyWith<$Res> {
  factory $CompanyCopyWith(Company value, $Res Function(Company) then) =
      _$CompanyCopyWithImpl<$Res, Company>;
  @useResult
  $Res call({String company_id, String company_name});
}

/// @nodoc
class _$CompanyCopyWithImpl<$Res, $Val extends Company>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? company_id = null,
    Object? company_name = null,
  }) {
    return _then(_value.copyWith(
      company_id: null == company_id
          ? _value.company_id
          : company_id // ignore: cast_nullable_to_non_nullable
              as String,
      company_name: null == company_name
          ? _value.company_name
          : company_name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompanyStateImplCopyWith<$Res>
    implements $CompanyCopyWith<$Res> {
  factory _$$CompanyStateImplCopyWith(
          _$CompanyStateImpl value, $Res Function(_$CompanyStateImpl) then) =
      __$$CompanyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String company_id, String company_name});
}

/// @nodoc
class __$$CompanyStateImplCopyWithImpl<$Res>
    extends _$CompanyCopyWithImpl<$Res, _$CompanyStateImpl>
    implements _$$CompanyStateImplCopyWith<$Res> {
  __$$CompanyStateImplCopyWithImpl(
      _$CompanyStateImpl _value, $Res Function(_$CompanyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? company_id = null,
    Object? company_name = null,
  }) {
    return _then(_$CompanyStateImpl(
      company_id: null == company_id
          ? _value.company_id
          : company_id // ignore: cast_nullable_to_non_nullable
              as String,
      company_name: null == company_name
          ? _value.company_name
          : company_name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyStateImpl implements _CompanyState {
  const _$CompanyStateImpl(
      {required this.company_id, required this.company_name});

  factory _$CompanyStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyStateImplFromJson(json);

  @override
  final String company_id;
  @override
  final String company_name;

  @override
  String toString() {
    return 'Company(company_id: $company_id, company_name: $company_name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyStateImpl &&
            (identical(other.company_id, company_id) ||
                other.company_id == company_id) &&
            (identical(other.company_name, company_name) ||
                other.company_name == company_name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, company_id, company_name);

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyStateImplCopyWith<_$CompanyStateImpl> get copyWith =>
      __$$CompanyStateImplCopyWithImpl<_$CompanyStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyStateImplToJson(
      this,
    );
  }
}

abstract class _CompanyState implements Company {
  const factory _CompanyState(
      {required final String company_id,
      required final String company_name}) = _$CompanyStateImpl;

  factory _CompanyState.fromJson(Map<String, dynamic> json) =
      _$CompanyStateImpl.fromJson;

  @override
  String get company_id;
  @override
  String get company_name;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompanyStateImplCopyWith<_$CompanyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
