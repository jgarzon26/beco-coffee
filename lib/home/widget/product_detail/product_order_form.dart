import 'package:beco_coffee/home/model/order.dart';
import 'package:beco_coffee/home/widget/product_detail/product_order_detail.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductOrderForm extends StatefulWidget {
  const ProductOrderForm({super.key});

  @override
  State<ProductOrderForm> createState() => _ProductOrderFormState();
}

class _ProductOrderFormState extends State<ProductOrderForm> {
  CoffeeSize? coffeeSize;
  CoffeeSugar? coffeeSugar;

  bool canInteract() {
    return coffeeSize != null && coffeeSugar != null;
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
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: kPrimaryContainer),
                    foregroundColor: kPrimaryContainer,
                  ),
                  onPressed: canInteract()
                      ? () {
                          context.goNamed('cart');
                        }
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Add Cart',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  disabledBackgroundColor: Colors.black.withOpacity(0.2),
                  backgroundColor: kPrimaryContainer,
                ),
                onPressed: canInteract() ? () {} : null,
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
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
