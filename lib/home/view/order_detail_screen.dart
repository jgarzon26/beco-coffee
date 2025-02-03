import 'dart:io';

import 'package:beco_coffee/home/controller/checkout_notifier.dart';
import 'package:beco_coffee/home/controller/order_notifier.dart';
import 'package:beco_coffee/home/model/order.dart';
import 'package:beco_coffee/home/widget/pickup_delivery/order_detail_items.dart';
import 'package:beco_coffee/home/widget/pickup_delivery/order_summary.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class OrderDetailScreen extends ConsumerWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(checkoutNotifierProvider.select(
      (value) => value.mode,
    ));

    final order = ref.watch(orderNotifierProvider.future);
    final currentBank =
        ref.watch(checkoutNotifierProvider.notifier).currentPayment();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Platform.isIOS ? CupertinoIcons.back : Icons.arrow_back,
          ),
        ),
        title: Text(
          mode.name[0].toUpperCase() + mode.name.substring(1),
        ),
      ),
      body: FutureBuilder(
        future: Future.wait([
          order,
          currentBank,
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          final order = snapshot.data![0] as Order?;

          if (snapshot.hasError || order == null) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final currentBank = snapshot.data![1] as String;

          final items = order.cartItems;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order ID : ${(order.order_id.split('-'))[0]}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                Text(
                  DateFormat('dd.MMM.yyyy').format(order.transaction_date),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(255, 193, 0, 1),
                      ),
                ),
                const Divider(),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.sizeOf(context).height * 0.2,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return OrderDetailItems(item: items[index]);
                    },
                  ),
                ),
                const Divider(),
                Text(
                  'Address',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'St 71, Terk Thlar, Sen Sok, Phnom Penh',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Text(
                  'Payment',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Gap(10),
                Center(
                  child: Container(
                    height: 60,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    decoration: BoxDecoration(
                      color: kPrimaryContainer,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Center(
                      child: Text(
                        currentBank,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: kOnPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                const Divider(),
                const OrderSummary(),
                const Spacer(flex: 2),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                      ),
                      onPressed: () {},
                      child: const Text('Confirm'),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
