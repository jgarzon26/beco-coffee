import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/model/order.dart';
import 'package:beco_coffee/home/repo/order_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_notifier.g.dart';

@riverpod
class OrderNotifier extends _$OrderNotifier {
  @override
  FutureOr<List<Order>> build() async {
    return ref.read(orderRepoProvider).getListOfOrders();
  }

  double get vat => 0.5;

  double get subtotal {
    var subtotal = 0.0;

    if (!state.hasValue) {
      return 0;
    }

    for (final order in state.value!) {
      final price = order.coffee.discount_price ?? order.coffee.price;
      final quantity = price * order.quantity;

      subtotal += quantity;
    }

    return subtotal;
  }

  Future<void> addOrder({
    required Coffee coffee,
    required CoffeeSize coffeeSize,
    required CoffeeSugar coffeeSugar,
  }) async {
    state = const AsyncLoading();
    try {
      await ref.read(orderRepoProvider).addOrder(
            Order(
              order_id: '',
              coffee: coffee,
              coffee_size: coffeeSize,
              coffee_sugar: coffeeSugar,
              order_date: DateTime.now(),
            ),
          );

      state = AsyncData(await ref.read(orderRepoProvider).getListOfOrders());
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  /// Make sure the list of orders have at least one order, otherwise don't call this function.
  /// This does not update the database to prevent refresh every inc/decrement
  void updateQuantity(int quantity, Order order) {
    if (!state.hasValue) {
      return;
    }

    final index = state.value!.indexOf(order);
    state.value!.remove(order);
    final newOrders = [...state.value!];
    newOrders.insert(index, order.copyWith(quantity: quantity));
    state = AsyncData(newOrders);
  }

  /// This function assumes the user has ordered something, otherwise does nothing.
  /// This updates the database
  Future<void> updateOrders() async {
    state = const AsyncLoading();
    try {
      await ref.read(orderRepoProvider).updateOrders(state.value!);
      state = AsyncData(await ref.read(orderRepoProvider).getListOfOrders());
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> updateDate() async {
    
  }
}
