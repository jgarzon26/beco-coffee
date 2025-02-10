import 'package:beco_coffee/home/model/item.dart';
import 'package:beco_coffee/home/widget/pickup_delivery/dash_line.dart';
import 'package:beco_coffee/home/widget/pickup_delivery/summary_row.dart';
import 'package:beco_coffee/utilities/item_util.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  final List<Item> items;

  const OrderSummary({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final subTotal = ItemUtil.getSubtotal(items);
    final vat = ItemUtil.vat;

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
              SummaryRow(title: 'Sub total', value: subTotal),
              SummaryRow(title: 'VAT', value: vat),
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
            children: [
              TableRow(
                children: [
                  const Text('Total'),
                  Text(
                    '${subTotal + vat}\$',
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
