import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_carousel.freezed.dart';

@freezed
class CoffeeCarouselModel with _$CoffeeCarouselModel {
  const factory CoffeeCarouselModel({
    required List coffeeImages,
    required int currentImageIndex,
  }) = _CoffeeCarouselModel;
}
