import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/widget/coffee_selection_panel.dart';
import 'package:flutter/material.dart';

class CoffeesSelection extends StatelessWidget {
  const CoffeesSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Coffee',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.65,
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
                  coffee: Coffee(
                    coffeeId: '',
                    category: '',
                    company: '',
                    name: 'Coffee',
                    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                    imageSrc: '',
                    price: 5.50,
                    rating: 2,
                    numberOfRatings: 92,
                    discountPrice: 2.50,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
