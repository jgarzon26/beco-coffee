import 'package:beco_coffee/home/controller/checkout_notifier.dart';
import 'package:beco_coffee/home/widget/pickup_delivery/dash_line.dart';
import 'package:beco_coffee/home/widget/pickup_delivery/summary_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderSummary extends ConsumerWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Summary',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyLarge ?? const TextStyle(),
          child: Table(
            columnWidths: const {
              0: FractionColumnWidth(0.3),
              1: FractionColumnWidth(0.5),
            },
            children: [
              SummaryRow(title: 'Sub total', value: 1.5),
              SummaryRow(title: 'VAT', value: 0.5),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: DashLine(),
        ),
        DefaultTextStyle(
          style: Theme.of(context).textTheme.headlineSmall ??
              const TextStyle(
                fontSize: 31,
                fontWeight: FontWeight.bold,
              ),
          child: Table(
            columnWidths: const {
              0: FractionColumnWidth(0.3),
              1: FractionColumnWidth(0.5),
            },
            children: const [
              TableRow(
                children: [
                  Text('Total'),
                  Text(
                    '2\$',
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
