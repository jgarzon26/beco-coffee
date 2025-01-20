import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/widget/search/search_result_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultView extends ConsumerWidget {
  const SearchResultView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return null;
      },
    );
  }
}
