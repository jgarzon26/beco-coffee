import 'package:beco_coffee/home/controller/search_notifier.dart';
import 'package:beco_coffee/home/widget/search/filter_row.dart';
import 'package:beco_coffee/home/widget/search/last_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchNotifierProvider.select(
      (searchModel) => searchModel.query,
    ));

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Column(
        children: [
          const FilterRow(),
          const SizedBox(height: 10),
          Expanded(
            child: searchQuery.isEmpty
                ? const LastSearchView()
                : const Placeholder(),
          ),
        ],
      ),
    );
  }
}
