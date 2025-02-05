import 'package:beco_coffee/home/model/checkout.dart';
import 'package:beco_coffee/home/repo/checkout_repo.dart';
import 'package:latlng/latlng.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'checkout_notifier.g.dart';

@Riverpod(keepAlive: true)
class CheckoutNotifier extends _$CheckoutNotifier {
  @override
  Checkout build() {
    return Checkout(
      mode: CheckoutMode.pickup,
      paymentIndex: 0,
      shopAddressIndex: 0,
      targetLocation: LatLng.degree(0, 0),
    );
  }

  void updateMode(CheckoutMode mode) {
    state = state.copyWith(mode: mode);
  }

  void updateShopAddressIndex(int index) {
    state = state.copyWith(shopAddressIndex: index);
  }

  void updateTargetLocation(LatLng latLng) {
    state = state.copyWith(targetLocation: latLng);
  }

  void updatePaymentIndex(int index) {
    state = state.copyWith(paymentIndex: index);
  }

  Future<String> currentPayment() async {
    final banks = await ref.read(becobankNamesProvider.future);
    return banks[state.paymentIndex];
  }
}
