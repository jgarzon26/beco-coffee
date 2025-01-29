import 'package:beco_coffee/home/model/coffee.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

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
class Item with _$Item {
  @JsonSerializable(explicitToJson: true,)
  const factory Item({
    required String item_id,
    required Coffee coffee,
    required CoffeeSize coffee_size,
    required CoffeeSugar coffee_sugar,
    required int quantity,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
