import 'package:beco_coffee/home/controller/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SummaryItems extends ConsumerWidget {
  const SummaryItems({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersRef = ref.watch(cartNotifierProvider);
    final subtotal = ref.watch(cartNotifierProvider.notifier).subtotal;
    final vat = ref.watch(cartNotifierProvider.notifier).vat;

    return ordersRef.when(
      data: (orders) {
        return DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                  ) ??
              const TextStyle(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Summary Items',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Gap(10),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.05,
                ),
                child: SingleChildScrollView(
                  child: Table(
                    columnWidths: const {
                      0: FractionColumnWidth(0.6),
                      1: FractionColumnWidth(0.4),
                    },
                    children: orders.map(
                      (order) {
                        return TableRow(
                          children: [
                            Text('${order.quantity}x ${order.coffee.name}'),
                            Text(
                                '${(order.coffee.discount_price ?? order.coffee.price) * order.quantity}\$'),
                          ],
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
              const Divider(),
              Table(
                columnWidths: const {
                  0: FractionColumnWidth(0.6),
                  1: FractionColumnWidth(0.4),
                },
                children: [
                  TableRow(
                    children: [
                      const Text('Sub total'),
                      Text('$subtotal\$'),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text('VAT'),
                      Text('$vat\$'),
                    ],
                  ),
                  TableRow(
                    children: List.generate(
                      2,
                      (index) => const SizedBox(height: 20),
                    ),
                  ),
                  TableRow(
                    children: [
                      Text(
                        'Total',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        '${subtotal + vat}\$',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Text('Error: $error');
      },
      loading: () => Container(),
    );
  }
}
