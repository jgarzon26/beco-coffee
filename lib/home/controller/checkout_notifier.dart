import 'package:beco_coffee/home/model/chckout.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'checkout_notifier.g.dart';

@Riverpod(keepAlive: true)
class CheckoutNotifier extends _$CheckoutNotifier {
  @override
  Checkout build() {
    return const Checkout.initialize();
  }

  void updateMode(CheckoutMode mode) {
    state = state.copyWith(mode: mode);
  }

  void updateShopAddressIndex(int index) {
    state = state.copyWith(shopAddressIndex: index);
  }

  void updatePaymentIndex(int index) {
    state = state.copyWith(paymentIndex: index);
  }
}
