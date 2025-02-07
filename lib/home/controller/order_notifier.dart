import 'package:beco_coffee/home/controller/cart_notifier.dart';
import 'package:beco_coffee/home/model/order.dart';
import 'package:beco_coffee/home/repo/order_repo.dart';
import 'package:latlng/latlng.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_notifier.g.dart';

@Riverpod(keepAlive: true)
class OrderNotifier extends _$OrderNotifier {
  @override
  FutureOr<Order?> build() async {
    return ref.read(orderRepoProvider).getLatestOrder();
  }

  Future<void> addOrder() async {
    if (state.hasValue || state.value != null) {
      return;
    }

    state = const AsyncLoading();
    try {
      final items = await ref.read(cartNotifierProvider.future);
      final itemIds = items.map((item) => item.item_id).toList();
      final addedOrder = await ref.read(orderRepoProvider).addOrder(itemIds);
      state = AsyncData(addedOrder);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> checkout(LatLng address) async {
    state = const AsyncLoading();
    try {
      final res = await ref
          .read(orderRepoProvider)
          .checkout(state.value!.order_id, address);
      state = AsyncData(res);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> onFinishOrder() async {
    state = const AsyncLoading();
    try {
      await ref.read(orderRepoProvider).finishOrder(state.value!.order_id);
      state = const AsyncData(null);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}
