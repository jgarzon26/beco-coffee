import 'package:beco_coffee/home/controller/cart_notifier.dart';
import 'package:beco_coffee/home/controller/checkout_notifier.dart';
import 'package:beco_coffee/home/controller/order_notifier.dart';
import 'package:beco_coffee/home/repo/checkout_repo.dart';
import 'package:beco_coffee/home/widget/checkout/checkout_options_column.dart';
import 'package:beco_coffee/home/widget/checkout/summary_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkoutOptions = ref.watch(checkoutOptionsProvider);
    

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
        ),
      ),
      body: checkoutOptions.when(
        data: (options) {
          final (shopAddresses, bankNames) = options;
          final targetLocation = ref.watch(
              checkoutNotifierProvider.select((value) => value.targetLocation));

          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(20),
                CheckoutOptionsColumn(
                  shopAddresses: shopAddresses,
                  bankNames: bankNames,
                ),
                const Divider(),
                const SummaryItems(),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                    onPressed: () {
                      context.goNamed('paid-screen');
                      ref
                          .read(orderNotifierProvider.notifier)
                          .checkout(targetLocation).then((value) {
                            ref.read(cartNotifierProvider.notifier).clearCart();
                          },);
                    },
                    child: const Text('Pay'),
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Container(),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
