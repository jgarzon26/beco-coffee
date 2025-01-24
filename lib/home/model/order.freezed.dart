// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String get order_id => throw _privateConstructorUsedError;
  Coffee get coffee => throw _privateConstructorUsedError;
  CoffeeSize get coffee_size => throw _privateConstructorUsedError;
  CoffeeSugar get coffee_sugar => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {String order_id,
      Coffee coffee,
      CoffeeSize coffee_size,
      CoffeeSugar coffee_sugar,
      int quantity});

  $CoffeeCopyWith<$Res> get coffee;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order_id = null,
    Object? coffee = null,
    Object? coffee_size = null,
    Object? coffee_sugar = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      order_id: null == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of Order
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
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String order_id,
      Coffee coffee,
      CoffeeSize coffee_size,
      CoffeeSugar coffee_sugar,
      int quantity});

  @override
  $CoffeeCopyWith<$Res> get coffee;
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order_id = null,
    Object? coffee = null,
    Object? coffee_size = null,
    Object? coffee_sugar = null,
    Object? quantity = null,
  }) {
    return _then(_$OrderImpl(
      order_id: null == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
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
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {required this.order_id,
      required this.coffee,
      required this.coffee_size,
      required this.coffee_sugar,
      this.quantity = 1});

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final String order_id;
  @override
  final Coffee coffee;
  @override
  final CoffeeSize coffee_size;
  @override
  final CoffeeSugar coffee_sugar;
  @override
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'Order(order_id: $order_id, coffee: $coffee, coffee_size: $coffee_size, coffee_sugar: $coffee_sugar, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.order_id, order_id) ||
                other.order_id == order_id) &&
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
      runtimeType, order_id, coffee, coffee_size, coffee_sugar, quantity);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {required final String order_id,
      required final Coffee coffee,
      required final CoffeeSize coffee_size,
      required final CoffeeSugar coffee_sugar,
      final int quantity}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  String get order_id;
  @override
  Coffee get coffee;
  @override
  CoffeeSize get coffee_size;
  @override
  CoffeeSugar get coffee_sugar;
  @override
  int get quantity;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
