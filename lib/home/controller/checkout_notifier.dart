import 'dart:collection';

import 'package:beco_coffee/home/model/checkout.dart';
import 'package:beco_coffee/home/repo/checkout_repo.dart';
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

  Future<String> currentPayment() async {
    final banks = await ref.read(becobankNamesProvider.future);
    return banks[state.paymentIndex];
  }
}
