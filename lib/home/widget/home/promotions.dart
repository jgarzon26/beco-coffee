import 'package:beco_coffee/home/controller/coffee_notifier.dart';
import 'package:beco_coffee/home/widget/home/promotions/promotions_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Promotions extends ConsumerWidget {
  const Promotions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promotions = ref.watch(getPromotionCoffeesProvider.call());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Promotion',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: promotions.when(
            data: (coffees) => PromotionsListView(promotions: coffees),
            error: (error, stackTrace) {
              return Text('Error: $error');
            },
            loading: () => const PromotionsListView(),
          ),
        ),
      ],
    );
  }
}
