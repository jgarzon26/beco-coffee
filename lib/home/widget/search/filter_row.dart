import 'package:beco_coffee/home/controller/search_notifier.dart';
import 'package:beco_coffee/home/model/search_model.dart';
import 'package:beco_coffee/home/widget/search/filter_search_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterRow extends ConsumerWidget {
  const FilterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const filters = ['none', 'Best Sell', 'Rating', 'Discount', 'A-Z', 'Z-A'];
    const types = FilterSearchType.values;
    final currentType = ref.watch(
        searchNotifierProvider.select((value) => value.filterSearchType));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: filters
          .where(
        (element) => element != 'none',
      )
          .map(
        (filter) {
          final type = types[filters.indexOf(filter)];

          return FilterSearchChip(
            label: filter,
            isSelected: currentType == type,
            onSelected: (value) {
              if (value) {
                ref
                    .read(searchNotifierProvider.notifier)
                    .setFilterSearchType(type);
              } else {
                ref
                    .read(searchNotifierProvider.notifier)
                    .setFilterSearchType(FilterSearchType.none);
              }
            },
          );
        },
      ).toList(),
    );
  }
}
