import 'package:beco_coffee/home/widget/cart/coupon_text_field.dart';
import 'package:beco_coffee/home/widget/cart/item_counter.dart';
import 'package:beco_coffee/home/widget/cart/order_summary_detail.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.2,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    tileColor: Colors.black.withOpacity(0.05),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 25,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    leading: const CircleAvatar(),
                    title: Text(
                      'Coffee Name',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      '1.5\$',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    trailing: const ItemCounter(),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  Text(
                    'Order Summary',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 15),
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.titleLarge ??
                        const TextStyle(),
                    child: Table(
                      columnWidths: const {
                        0: FractionColumnWidth(0.3),
                      },
                      children: const [
                        TableRow(
                          children: [
                            Text('Sub total'),
                            Center(child: Text('1.5\$')),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox(height: 10),
                            SizedBox(height: 10),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text('VAT'),
                            Center(child: Text('0.5\$')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: CouponTextField(),
                  ),
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ) ??
                        const TextStyle(),
                    child: Table(
                      columnWidths: const {
                        0: FractionColumnWidth(0.3),
                      },
                      children: const [
                        TableRow(
                          children: [
                            Text('Total'),
                            Center(child: Text('2\$')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kPrimaryContainer,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Place Order',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
 
 */