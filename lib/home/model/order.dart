import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';

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
  const factory Order({
    required String order_id,
    required String coffeeName,
    required CoffeeSize size,
    required CoffeeSugar sugar,
    @Default(1) int quantity,
  }) = _Order;
}
