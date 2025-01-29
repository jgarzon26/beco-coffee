// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get item_id => throw _privateConstructorUsedError;
  Coffee get coffee => throw _privateConstructorUsedError;
  CoffeeSize get coffee_size => throw _privateConstructorUsedError;
  CoffeeSugar get coffee_sugar => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String item_id,
      Coffee coffee,
      CoffeeSize coffee_size,
      CoffeeSugar coffee_sugar,
      int quantity});

  $CoffeeCopyWith<$Res> get coffee;
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item_id = null,
    Object? coffee = null,
    Object? coffee_size = null,
    Object? coffee_sugar = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      item_id: null == item_id
          ? _value.item_id
          : item_id // ignore: cast_nullable_to_non_nullable
              as String,
      coffee: null == coffee
          ? _value.coffee
          : coffee // ignore: cast_nullable_to_non_nullable
              as Coffee,
      coffee_size: null == coffee_size
          ? _value.coffee_size
          : coffee_size // ignore: cast_nullable_to_non_nullable
              as CoffeeSize,
      coffee_sugar: null == coffee_sugar
          ? _value.coffee_sugar
          : coffee_sugar // ignore: cast_nullable_to_non_nullable
              as CoffeeSugar,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoffeeCopyWith<$Res> get coffee {
    return $CoffeeCopyWith<$Res>(_value.coffee, (value) {
      return _then(_value.copyWith(coffee: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String item_id,
      Coffee coffee,
      CoffeeSize coffee_size,
      CoffeeSugar coffee_sugar,
      int quantity});

  @override
  $CoffeeCopyWith<$Res> get coffee;
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item_id = null,
    Object? coffee = null,
    Object? coffee_size = null,
    Object? coffee_sugar = null,
    Object? quantity = null,
  }) {
    return _then(_$ItemImpl(
      item_id: null == item_id
          ? _value.item_id
          : item_id // ignore: cast_nullable_to_non_nullable
              as String,
      coffee: null == coffee
          ? _value.coffee
          : coffee // ignore: cast_nullable_to_non_nullable
              as Coffee,
      coffee_size: null == coffee_size
          ? _value.coffee_size
          : coffee_size // ignore: cast_nullable_to_non_nullable
              as CoffeeSize,
      coffee_sugar: null == coffee_sugar
          ? _value.coffee_sugar
          : coffee_sugar // ignore: cast_nullable_to_non_nullable
              as CoffeeSugar,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ItemImpl implements _Item {
  const _$ItemImpl(
      {required this.item_id,
      required this.coffee,
      required this.coffee_size,
      required this.coffee_sugar,
      required this.quantity});

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  final String item_id;
  @override
  final Coffee coffee;
  @override
  final CoffeeSize coffee_size;
  @override
  final CoffeeSugar coffee_sugar;
  @override
  final int quantity;

  @override
  String toString() {
    return 'Item(item_id: $item_id, coffee: $coffee, coffee_size: $coffee_size, coffee_sugar: $coffee_sugar, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.item_id, item_id) || other.item_id == item_id) &&
            (identical(other.coffee, coffee) || other.coffee == coffee) &&
            (identical(other.coffee_size, coffee_size) ||
                other.coffee_size == coffee_size) &&
            (identical(other.coffee_sugar, coffee_sugar) ||
                other.coffee_sugar == coffee_sugar) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, item_id, coffee, coffee_size, coffee_sugar, quantity);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {required final String item_id,
      required final Coffee coffee,
      required final CoffeeSize coffee_size,
      required final CoffeeSugar coffee_sugar,
      required final int quantity}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  String get item_id;
  @override
  Coffee get coffee;
  @override
  CoffeeSize get coffee_size;
  @override
  CoffeeSugar get coffee_sugar;
  @override
  int get quantity;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
