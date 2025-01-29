import 'package:beco_coffee/home/controller/cart_notifier.dart';
import 'package:beco_coffee/home/model/item.dart';
import 'package:beco_coffee/home/widget/cart/item_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderListTile extends StatelessWidget {
  final Item item;

  const OrderListTile({super.key, required this.item});

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
        foregroundImage: NetworkImage(item.coffee.image_src),
      ),
      title: Text(
        item.coffee.name,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(
        '${item.coffee.discount_price ?? item.coffee.price}\$',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: Consumer(builder: (context, ref, child) {
        return ItemCounter(
          initialCount: item.quantity,
          onChange: (counter) {
            ref
                .read(cartNotifierProvider.notifier)
                .updateQuantity(counter, item);
          },
        );
      }),
    );
  }
}
