import 'package:beco_coffee/home/controller/order_notifier.dart';
import 'package:beco_coffee/home/repo/checkout_repo.dart';
import 'package:beco_coffee/home/widget/checkout/checkout_options_column.dart';
import 'package:beco_coffee/home/widget/checkout/summary_items.dart';
import 'package:beco_coffee/theme/theme.dart';
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
                TextButton(
                  onPressed: () {
                    ref.read(orderNotifierProvider.notifier).checkout();
                    context.goNamed('paid-screen');
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    height: 40,
                    decoration: BoxDecoration(
                      color: kPrimaryContainer,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Pay',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: kOnPrimaryContainer,
                            ),
                      ),
                    ),
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
