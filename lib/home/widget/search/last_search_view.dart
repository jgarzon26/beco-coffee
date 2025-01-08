import 'package:beco_coffee/home/widget/coffee_selection_panel.dart';
import 'package:flutter/material.dart';

class LastSearchView extends StatelessWidget {
  const LastSearchView({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 15,
            crossAxisSpacing: 20,
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            children: List.generate(
              4,
              (index) {
                return const CoffeeSelectionPanel(
                  name: 'Coffee',
                  imageSrc: '',
                  price: 5.50,
                  discountPrice: 2.50,
                  avgRating: 2,
                  numberOfRating: 92,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
