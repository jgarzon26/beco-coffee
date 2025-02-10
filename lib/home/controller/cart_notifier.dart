import 'package:beco_coffee/home/model/item.dart';
import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/repo/cart_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_notifier.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  FutureOr<List<Item>> build() async {
    return ref.read(cartRepoProvider).getItemsFromCart();
  }

  Future<void> addItemToCart({
    required Coffee coffee,
    required CoffeeSize coffeeSize,
    required CoffeeSugar coffeeSugar,
  }) async {
    state = const AsyncLoading();
    try {
      await ref.read(cartRepoProvider).addItemToCart(
            Item(
              item_id: '',
              coffee: coffee,
              coffee_size: coffeeSize,
              coffee_sugar: coffeeSugar,
              quantity: 1,
            ),
          );
      state = AsyncData(await ref.read(cartRepoProvider).getItemsFromCart());
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  /// Make sure the list of orders have at least one order, otherwise don't call this function.
  /// This does not update the database to prevent refresh every inc/decrement
  void updateQuantity(int quantity, Item item) {
    if (!state.hasValue) {
      return;
    }

    final prevItems = [...state.value!];

    final index = prevItems.indexOf(item);
    prevItems.remove(item);
    final newItems = [...prevItems];
    newItems.insert(index, item.copyWith(quantity: quantity));
    state = AsyncData(newItems);
  }

  /// This function assumes the user has ordered something, otherwise does nothing.
  /// This updates the database
  Future<void> updateItems() async {
    state = const AsyncLoading();
    try {
      await ref.read(cartRepoProvider).updateItems(state.value!);
      state = AsyncData(await ref.read(cartRepoProvider).getItemsFromCart());
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  void clearCart() {
    state = const AsyncLoading();
    state = const AsyncData([]);
  }
}
