import 'package:beco_coffee/home/controller/search_notifier.dart';
import 'package:beco_coffee/home/model/search_model.dart';
import 'package:beco_coffee/home/widget/search/filter_search_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    const filters = ['Best Sell', 'Rating', 'Discount', 'A-Z', 'Z-A'];
    const types = FilterSearchType.values;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: filters.map(
        (filter) {
          return Consumer(
            builder: (context, ref, child) {
              return FilterSearchChip(
                label: filter,
                onSelected: (value) {
                  if (value) {
                    ref.read(searchNotifierProvider.notifier).setState(types[filters.indexOf(filter)]);
                  } else {
                    ref.read(searchNotifierProvider.notifier).setState(FilterSearchType.none);
                  }
                },
              );
            }
          );
        },
      ).toList(),
    );
  }
}