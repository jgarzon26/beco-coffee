import 'package:beco_coffee/home/model/coffee_carousel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'carousel_notifier.g.dart';

@riverpod
class CarouselNotifier extends _$CarouselNotifier {
  @override
  CoffeeCarouselModel build() {
    return const CoffeeCarouselModel(
      coffeeImages: [1, 2, 3, 4, 5],
      currentImageIndex: 0,
    );
  }

  void changeImageIndex(int index) {
    state = state.copyWith(currentImageIndex: index);
  }
}
