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
        return const SearchResultTile(
          coffee: Coffee(
            coffeeId: '',
            category: '',
            company: 'Starbuck',
            name: 'Coffee Name',
            description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
            imageSrc: '',
            price: 1.50,
            rating: 8.1,
            numberOfRatings: 20,
            discountPrice: 1.00,
          ),
        );
      },
    );
  }
}