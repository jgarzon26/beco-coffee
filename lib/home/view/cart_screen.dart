import 'package:beco_coffee/home/controller/cart_notifier.dart';
import 'package:beco_coffee/home/controller/checkout_notifier.dart';
import 'package:beco_coffee/home/controller/order_notifier.dart';
import 'package:beco_coffee/home/repo/checkout_repo.dart';
import 'package:beco_coffee/home/widget/cart/coupon_text_field.dart';
import 'package:beco_coffee/home/widget/cart/order_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersRef = ref.watch(cartNotifierProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: ordersRef.when(
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: Text(
                'No items yet. Order some coffee!',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          }

          final subtotal = ref.watch(cartNotifierProvider.notifier).subtotal;
          final vat = ref.watch(cartNotifierProvider.notifier).vat;

          return Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.25,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: OrderListTile(item: items[index]),
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
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
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
                          children: [
                            TableRow(
                              children: [
                                const Text('Sub total'),
                                Center(
                                    child: Text(
                                        '${subtotal.toStringAsFixed(2)}\$')),
                              ],
                            ),
                            const TableRow(
                              children: [
                                SizedBox(height: 10),
                                SizedBox(height: 10),
                              ],
                            ),
                            TableRow(
                              children: [
                                const Text('VAT'),
                                Center(child: Text('$vat\$')),
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
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ) ??
                                const TextStyle(),
                        child: Table(
                          columnWidths: const {
                            0: FractionColumnWidth(0.3),
                          },
                          children: [
                            TableRow(
                              children: [
                                const Text('Total'),
                                Center(
                                    child: Text(
                                        '${(subtotal + vat).toStringAsFixed(2)}\$')),
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
                            onPressed: () async {
                              context.pushNamed('checkout');
                              final index = ref
                                  .read(checkoutNotifierProvider)
                                  .shopAddressIndex;
                              final offices = await ref
                                  .read(becoOfficeLocationsProvider.future);
                              ref
                                  .read(checkoutNotifierProvider.notifier)
                                  .updateTargetLocation(offices[index].latlng);
                              ref
                                  .read(orderNotifierProvider.notifier)
                                  .addOrder();
                            },
                            child: Text(
                              'Place Order',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
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
          );
        },
        error: (error, stackTrace) {
          return Text('Error: $error');
        },
        loading: () {
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
