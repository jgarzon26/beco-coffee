import 'package:latlng/latlng.dart';

enum CheckoutMode { pickup, delivery }

class Checkout {
  final CheckoutMode mode;
  final int shopAddressIndex;
  final int paymentIndex;
  final LatLng targetLocation;

  const Checkout({
    required this.mode,
    required this.shopAddressIndex,
    required this.paymentIndex,
    required this.targetLocation,
  });

  Checkout copyWith({
    CheckoutMode? mode,
    int? shopAddressIndex,
    int? paymentIndex,
    LatLng? targetLocation,
  }) {
    return Checkout(
      mode: mode ?? this.mode,
      shopAddressIndex: shopAddressIndex ?? this.shopAddressIndex,
      paymentIndex: paymentIndex ?? this.paymentIndex,
      targetLocation: targetLocation ?? this.targetLocation,
    );
  }
}
