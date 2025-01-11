import 'package:flutter/material.dart';

class OrderSummaryDetail extends StatelessWidget {
  final String title;
  final double price;

  const OrderSummaryDetail({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(flex: 2),
        Text(
          '$price\$',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(),
      ],
    );
  }
}
