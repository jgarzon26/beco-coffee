import 'package:beco_coffee/auth/repo/auth_repo.dart';
import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/repo/coffee_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wishlist_notifier.g.dart';

@riverpod
class WishlistNotifier extends _$WishlistNotifier {
  @override
  FutureOr<List<Coffee>> build() async {
    final wishlistIds = await ref.read(authRepoProvider).getUserWishList();
    return ref.read(coffeeRepoProvider).convertCoffeeIdsToCoffee(wishlistIds);
  }

  Future<void> toggleCoffeeWishlist(Coffee coffee, bool isWishlisted) async {
    List<Coffee> updatedWishLists;

    if (isWishlisted) {
      updatedWishLists = [...state.value!, coffee];
    } else {
      updatedWishLists =
          state.value!.where((e) => e.coffee_id != coffee.coffee_id).toList();
    }

    state = const AsyncLoading();
    final coffeeIDs =
        updatedWishLists.map((coffee) => coffee.coffee_id).toList();
    state = await AsyncValue.guard(() async {
      final res = await ref.read(authRepoProvider).updateCoffeeWishList(coffeeIDs);
      return ref.read(coffeeRepoProvider).convertCoffeeIdsToCoffee(res);
    });
  }
}
