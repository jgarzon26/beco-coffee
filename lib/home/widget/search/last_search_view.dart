import 'package:beco_coffee/home/controller/search_history_notifier.dart';
import 'package:beco_coffee/home/controller/search_notifier.dart';
import 'package:beco_coffee/home/widget/coffee_grid_view.dart';
import 'package:beco_coffee/utilities/search_filter_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LastSearchView extends ConsumerWidget {
  const LastSearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQueries = ref.watch(searchHistoryNotifierProvider);
    final filterType = ref.watch(searchNotifierProvider.select(
      (value) => value.filterSearchType,
    ));

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Last Search',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: searchQueries.when(
            data: (coffees) {
              final filteredCoffees = SearchFilterHelper.filterCoffee(coffees: coffees, filterType: filterType);
              return CoffeeGridView(
                coffees: filteredCoffees,
              );
            },
            error: (error, stackTrace) => Center(child: Text(error.toString())),
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
          ),
        ),
      ],
    );
  }
}
