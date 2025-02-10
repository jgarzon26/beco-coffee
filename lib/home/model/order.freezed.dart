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

/// @nodoc
mixin _$Order {
  String get order_id => throw _privateConstructorUsedError;
  String get buyer_id => throw _privateConstructorUsedError;
  List<Item> get cartItems => throw _privateConstructorUsedError;
  DateTime get transaction_date => throw _privateConstructorUsedError;
  LatLng get transaction_address => throw _privateConstructorUsedError;

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
      String buyer_id,
      List<Item> cartItems,
      DateTime transaction_date,
      LatLng transaction_address});
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
    Object? buyer_id = null,
    Object? cartItems = null,
    Object? transaction_date = null,
    Object? transaction_address = null,
  }) {
    return _then(_value.copyWith(
      order_id: null == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String,
      buyer_id: null == buyer_id
          ? _value.buyer_id
          : buyer_id // ignore: cast_nullable_to_non_nullable
              as String,
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      transaction_date: null == transaction_date
          ? _value.transaction_date
          : transaction_date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transaction_address: null == transaction_address
          ? _value.transaction_address
          : transaction_address // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ) as $Val);
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
      String buyer_id,
      List<Item> cartItems,
      DateTime transaction_date,
      LatLng transaction_address});
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
    Object? buyer_id = null,
    Object? cartItems = null,
    Object? transaction_date = null,
    Object? transaction_address = null,
  }) {
    return _then(_$OrderImpl(
      order_id: null == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String,
      buyer_id: null == buyer_id
          ? _value.buyer_id
          : buyer_id // ignore: cast_nullable_to_non_nullable
              as String,
      cartItems: null == cartItems
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      transaction_date: null == transaction_date
          ? _value.transaction_date
          : transaction_date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transaction_address: null == transaction_address
          ? _value.transaction_address
          : transaction_address // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {required this.order_id,
      required this.buyer_id,
      required final List<Item> cartItems,
      required this.transaction_date,
      required this.transaction_address})
      : _cartItems = cartItems;

  @override
  final String order_id;
  @override
  final String buyer_id;
  final List<Item> _cartItems;
  @override
  List<Item> get cartItems {
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  @override
  final DateTime transaction_date;
  @override
  final LatLng transaction_address;

  @override
  String toString() {
    return 'Order(order_id: $order_id, buyer_id: $buyer_id, cartItems: $cartItems, transaction_date: $transaction_date, transaction_address: $transaction_address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.order_id, order_id) ||
                other.order_id == order_id) &&
            (identical(other.buyer_id, buyer_id) ||
                other.buyer_id == buyer_id) &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems) &&
            (identical(other.transaction_date, transaction_date) ||
                other.transaction_date == transaction_date) &&
            (identical(other.transaction_address, transaction_address) ||
                other.transaction_address == transaction_address));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      order_id,
      buyer_id,
      const DeepCollectionEquality().hash(_cartItems),
      transaction_date,
      transaction_address);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);
}

abstract class _Order implements Order {
  const factory _Order(
      {required final String order_id,
      required final String buyer_id,
      required final List<Item> cartItems,
      required final DateTime transaction_date,
      required final LatLng transaction_address}) = _$OrderImpl;

  @override
  String get order_id;
  @override
  String get buyer_id;
  @override
  List<Item> get cartItems;
  @override
  DateTime get transaction_date;
  @override
  LatLng get transaction_address;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
