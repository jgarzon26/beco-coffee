// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      order_id: json['order_id'] as String,
      buyer_id: json['buyer_id'] as String,
      cartItems: (json['cartItems'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      transaction_date: DateTime.parse(json['transaction_date'] as String),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'buyer_id': instance.buyer_id,
      'cartItems': instance.cartItems,
      'transaction_date': instance.transaction_date.toIso8601String(),
    };
