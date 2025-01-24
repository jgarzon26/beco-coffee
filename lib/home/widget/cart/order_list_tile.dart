import 'package:beco_coffee/home/controller/order_notifier.dart';
import 'package:beco_coffee/home/model/order.dart';
import 'package:beco_coffee/home/widget/cart/item_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderListTile extends StatelessWidget {
  final Order order;

  const OrderListTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.black.withOpacity(0.05),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 25,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      leading: CircleAvatar(
        radius: 30,
        foregroundImage: NetworkImage(order.coffee.image_src),
      ),
      title: Text(
        order.coffee.name,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(
        '${order.coffee.discount_price ?? order.coffee.price}\$',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: Consumer(builder: (context, ref, child) {
        return ItemCounter(
          initialCount: order.quantity,
          onChange: (counter) {
            ref
                .read(orderNotifierProvider.notifier)
                .updateQuantity(counter, order);
          },
        );
      }),
    );
  }
}
