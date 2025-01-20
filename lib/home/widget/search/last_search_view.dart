import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/widget/coffee_grid_view.dart';
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
          child: CoffeeGridView(
            coffees: List.generate(
              4,
              (index) {
                return Coffee(
                  coffeeId: index.toString(),
                  category: '',
                  company: '',
                  name: 'Coffee',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                  imageSrc: '',
                  price: 5.50,
                  rating: 2,
                  numberOfRatings: 92,
                  discountPrice: 2.50,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
