import 'package:beco_coffee/home/model/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required String order_id,
    required String buyer_id,
    required List<Item> cartItems,
    required DateTime transaction_date,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
