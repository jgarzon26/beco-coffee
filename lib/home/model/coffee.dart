import 'package:beco_coffee/home/model/category.dart';
import 'package:beco_coffee/home/model/company.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee.freezed.dart';
part 'coffee.g.dart';

@freezed
class Coffee with _$Coffee {
  const factory Coffee({
    required String coffee_id,
    required Category category,
    required Company company,
    required String name,
    required String description,
    required String image_src,
    required double price,
    double? discount_price,
    required double rating,
    required int number_of_ratings,
  }) = _Coffee;

  factory Coffee.fromJson(Map<String, dynamic> json) => _$CoffeeFromJson(json);
}
