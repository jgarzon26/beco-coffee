enum CheckoutMode { pickup, delivery }

class Checkout {
  final CheckoutMode mode;
  final int shopAddressIndex;
  final int paymentIndex;
  
  const Checkout({
    required this.mode,
    required this.shopAddressIndex,
    required this.paymentIndex,
  });

  const Checkout.initialize() : mode = CheckoutMode.pickup, shopAddressIndex = 0, paymentIndex = 0;

  Checkout copyWith({
    CheckoutMode? mode,
    int? shopAddressIndex,
    int? paymentIndex,
  }) {
    return Checkout(
      mode: mode ?? this.mode,
      shopAddressIndex: shopAddressIndex ?? this.shopAddressIndex,
      paymentIndex: paymentIndex ?? this.paymentIndex,
    );
  }
}