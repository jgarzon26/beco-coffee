import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/model/order.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:transparent_image/transparent_image.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.coffee,
    required this.status,
  });

  final Coffee coffee;
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final statusRecord = switch (status) {
      OrderStatus.onDelivery => ('Delivery', Colors.lime),
      OrderStatus.process => ('Process', const Color.fromRGBO(255, 4, 95, 1)),
      OrderStatus.success => (
          'Completed',
          const Color.fromRGBO(255, 193, 0, 1)
        ),
    };

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.black.withValues(alpha: 0.05),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: coffee.image_src,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Gap(15),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffee.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Gap(5),
                Text(
                  '1 items',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Gap(5),
                Text(
                  '1.5\$',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Gap(5),
                Text(
                  statusRecord.$1,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: statusRecord.$2,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}