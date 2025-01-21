import 'package:beco_coffee/home/controller/coffee_notifier.dart';
import 'package:beco_coffee/home/controller/search_notifier.dart';
import 'package:beco_coffee/home/widget/search/search_result_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultView extends ConsumerWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coffees = ref.watch(coffeeNotifierProvider);
    final searchQuery = ref.watch(searchNotifierProvider.select(
      (search) => search.query,
    ));

    return coffees.when(
      data: (coffees) {
        final searchResults = coffees.where(
          (coffee) {
            return coffee.name
                .toLowerCase()
                .contains(searchQuery.toLowerCase());
          },
        ).toList();

        return ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return SearchResultTile(coffee: searchResults[index]);
          },
        );
      },
      error: (error, stackTrace) => const Text('Error searching'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
