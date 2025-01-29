
import 'package:beco_coffee/home/controller/cart_notifier.dart';
import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/model/item.dart';
import 'package:beco_coffee/home/widget/product_detail/product_order_detail.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductOrderForm extends StatefulWidget {
  final Coffee coffee;

  const ProductOrderForm({super.key, required this.coffee});

  @override
  State<ProductOrderForm> createState() => _ProductOrderFormState();
}

class _ProductOrderFormState extends State<ProductOrderForm> {
  CoffeeSize? coffeeSize;
  CoffeeSugar? coffeeSugar;

  bool canInteract() {
    return coffeeSize != null && coffeeSugar != null;
  }

  void addToCart(WidgetRef ref) {
    ref.read(cartNotifierProvider.notifier).addItemToCart(
          coffee: widget.coffee,
          coffeeSize: coffeeSize!,
          coffeeSugar: coffeeSugar!,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductOrderDetail(
          onCoffeeSizeChange: (value) => setState(() => coffeeSize = value),
          onCoffeeSugarChange: (value) => setState(() => coffeeSugar = value),
        ),
        const Spacer(flex: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Opacity(
                opacity: canInteract() ? 1 : 0.2,
                child: Consumer(builder: (context, ref, child) {
                  return OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: kPrimaryContainer),
                      foregroundColor: kPrimaryContainer,
                    ),
                    onPressed: canInteract()
                        ? () {
                            addToCart(ref);
                          }
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Add Cart',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                return OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    disabledBackgroundColor: Colors.black.withOpacity(0.2),
                    backgroundColor: kPrimaryContainer,
                  ),
                  onPressed: canInteract()
                      ? () {
                          addToCart(ref);
                          context.goNamed('cart');
                        }
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Buy Now',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: canInteract()
                                ? kOnPrimaryContainer
                                : Colors.black.withOpacity(0.2),
                          ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
