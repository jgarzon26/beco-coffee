// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coffee_carousel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoffeeCarouselModel {
  List<Coffee> get coffeeImages => throw _privateConstructorUsedError;
  int get currentImageIndex => throw _privateConstructorUsedError;

  /// Create a copy of CoffeeCarouselModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoffeeCarouselModelCopyWith<CoffeeCarouselModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeCarouselModelCopyWith<$Res> {
  factory $CoffeeCarouselModelCopyWith(
          CoffeeCarouselModel value, $Res Function(CoffeeCarouselModel) then) =
      _$CoffeeCarouselModelCopyWithImpl<$Res, CoffeeCarouselModel>;
  @useResult
  $Res call({List<Coffee> coffeeImages, int currentImageIndex});
}

/// @nodoc
class _$CoffeeCarouselModelCopyWithImpl<$Res, $Val extends CoffeeCarouselModel>
    implements $CoffeeCarouselModelCopyWith<$Res> {
  _$CoffeeCarouselModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoffeeCarouselModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coffeeImages = null,
    Object? currentImageIndex = null,
  }) {
    return _then(_value.copyWith(
      coffeeImages: null == coffeeImages
          ? _value.coffeeImages
          : coffeeImages // ignore: cast_nullable_to_non_nullable
              as List<Coffee>,
      currentImageIndex: null == currentImageIndex
          ? _value.currentImageIndex
          : currentImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoffeeCarouselModelImplCopyWith<$Res>
    implements $CoffeeCarouselModelCopyWith<$Res> {
  factory _$$CoffeeCarouselModelImplCopyWith(_$CoffeeCarouselModelImpl value,
          $Res Function(_$CoffeeCarouselModelImpl) then) =
      __$$CoffeeCarouselModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Coffee> coffeeImages, int currentImageIndex});
}

/// @nodoc
class __$$CoffeeCarouselModelImplCopyWithImpl<$Res>
    extends _$CoffeeCarouselModelCopyWithImpl<$Res, _$CoffeeCarouselModelImpl>
    implements _$$CoffeeCarouselModelImplCopyWith<$Res> {
  __$$CoffeeCarouselModelImplCopyWithImpl(_$CoffeeCarouselModelImpl _value,
      $Res Function(_$CoffeeCarouselModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoffeeCarouselModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coffeeImages = null,
    Object? currentImageIndex = null,
  }) {
    return _then(_$CoffeeCarouselModelImpl(
      coffeeImages: null == coffeeImages
          ? _value._coffeeImages
          : coffeeImages // ignore: cast_nullable_to_non_nullable
              as List<Coffee>,
      currentImageIndex: null == currentImageIndex
          ? _value.currentImageIndex
          : currentImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CoffeeCarouselModelImpl implements _CoffeeCarouselModel {
  const _$CoffeeCarouselModelImpl(
      {required final List<Coffee> coffeeImages,
      required this.currentImageIndex})
      : _coffeeImages = coffeeImages;

  final List<Coffee> _coffeeImages;
  @override
  List<Coffee> get coffeeImages {
    if (_coffeeImages is EqualUnmodifiableListView) return _coffeeImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coffeeImages);
  }

  @override
  final int currentImageIndex;

  @override
  String toString() {
    return 'CoffeeCarouselModel(coffeeImages: $coffeeImages, currentImageIndex: $currentImageIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoffeeCarouselModelImpl &&
            const DeepCollectionEquality()
                .equals(other._coffeeImages, _coffeeImages) &&
            (identical(other.currentImageIndex, currentImageIndex) ||
                other.currentImageIndex == currentImageIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_coffeeImages), currentImageIndex);

  /// Create a copy of CoffeeCarouselModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoffeeCarouselModelImplCopyWith<_$CoffeeCarouselModelImpl> get copyWith =>
      __$$CoffeeCarouselModelImplCopyWithImpl<_$CoffeeCarouselModelImpl>(
          this, _$identity);
}

abstract class _CoffeeCarouselModel implements CoffeeCarouselModel {
  const factory _CoffeeCarouselModel(
      {required final List<Coffee> coffeeImages,
      required final int currentImageIndex}) = _$CoffeeCarouselModelImpl;

  @override
  List<Coffee> get coffeeImages;
  @override
  int get currentImageIndex;

  /// Create a copy of CoffeeCarouselModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoffeeCarouselModelImplCopyWith<_$CoffeeCarouselModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
