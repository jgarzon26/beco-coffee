import 'package:beco_coffee/auth/repo/auth_repo.dart';
import 'package:beco_coffee/home/model/order.dart';
import 'package:beco_coffee/home/repo/order_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_notifier.g.dart';

@riverpod
class OrderNotifier extends _$OrderNotifier {
  @override
  FutureOr<Order?> build() async {
    final user = ref.read(authRepoProvider).currentUser;

    if (user == null) {
      return null;
    }

    return ref.read(orderRepoProvider).getOrderByUserId(user.id);
  }

  Future<void> checkout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(orderRepoProvider).checkout(state.value?.order_id));
  }
}
