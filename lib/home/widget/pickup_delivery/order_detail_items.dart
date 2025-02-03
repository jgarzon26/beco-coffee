import 'package:beco_coffee/home/model/item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderDetailItems extends StatelessWidget {
  final Item item;

  const OrderDetailItems({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final quantity = item.quantity;
    final coffee = item.coffee;

    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.network(
            coffee.image_src,
            fit: BoxFit.cover,
            width: 100,
          ),
        ),
        const Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              coffee.name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Gap(5),
            Text(
              '$quantity ${quantity > 1 ? 'items' : 'item'}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Gap(5),
            Text(
              '${coffee.discount_price ?? coffee.price}\$',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
