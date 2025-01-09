import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee.freezed.dart';

@freezed
class Coffee with _$Coffee {
  const factory Coffee({
     required String coffeeId,
     required String category,
     required String company,
     required String name,
     required String description,
     required String imageSrc,
     required double price,
     double? discountPrice,
     required double rating,
     required int numberOfRatings,
  }) = _Coffee;
}
