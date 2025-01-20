import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/widget/coffee_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoffeesSelection extends ConsumerWidget {
  const CoffeesSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Coffee',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.65,
          child: CoffeeGridView(
            coffees: [],
          ),
        ),
      ],
    );
  }
}
