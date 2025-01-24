import 'package:beco_coffee/home/model/coffee.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

enum CoffeeSize {
  small,
  medium,
  large,
}

enum CoffeeSugar {
  s20,
  s50,
  s80,
  s100,
}

@freezed
class Order with _$Order {
  @JsonSerializable(explicitToJson: true,)
  const factory Order({
    required String order_id,
    required Coffee coffee,
    required CoffeeSize coffee_size,
    required CoffeeSugar coffee_sugar,
    @Default(1) int quantity,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
