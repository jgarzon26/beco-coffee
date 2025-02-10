import 'package:beco_coffee/home/model/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlng/latlng.dart';

part 'order.freezed.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required String order_id,
    required String buyer_id,
    required List<Item> cartItems,
    required DateTime transaction_date,
    required LatLng transaction_address,
  }) = _Order;

  factory Order.fromJsonWhileManuallyAddCart(
      Map<String, dynamic> json, List<Item> cartItems) {
    return Order(
      order_id: json['order_id'],
      buyer_id: json['buyer_id'],
      cartItems: cartItems,
      transaction_date: DateTime.tryParse(json['transaction_date'] ?? '') ?? DateTime.now(),
      transaction_address: LatLng(Angle.degree(json['transaction_address']?['lat'] ?? 0),
          Angle.degree(json['transaction_address']?['lng'] ?? 0)),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      order_id: json['order_id'],
      buyer_id: json['buyer_id'],
      cartItems: (json['cartItems'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      transaction_date: DateTime.tryParse(json['transaction_date'] ?? '') ?? DateTime.now(),
      transaction_address: LatLng(
          Angle.degree(json['transaction_address']?['lat'] ?? 0),
          Angle.degree(json['transaction_address']?['lng'] ?? 0)),
    );
  }
}
