import 'package:beco_coffee/home/repo/checkout_repo.dart';
import 'package:beco_coffee/home/widget/checkout/checkout_options_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

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
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Gap(20),
                Expanded(
                  child: CheckoutOptionsColumn(
                    shopAddresses: options,
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
