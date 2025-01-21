import 'package:beco_coffee/home/model/coffee_carousel.dart';
import 'package:beco_coffee/home/repo/coffee_repo.dart';
import 'package:beco_coffee/utilities/random.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'carousel_notifier.g.dart';

@riverpod
class CarouselNotifier extends _$CarouselNotifier {
  @override
  FutureOr<CoffeeCarouselModel> build() async {
    final coffees = await ref.read(coffeeRepoProvider).getAllCoffees();
    final randCoffees = getRandomItems(items: coffees, count: 5);

    return CoffeeCarouselModel(
      coffeeImages: randCoffees,
      currentImageIndex: 0,
    );
  }

  void changeImageIndex(int index) {
    state = AsyncData(state.value!.copyWith(currentImageIndex: index));
  }
}
