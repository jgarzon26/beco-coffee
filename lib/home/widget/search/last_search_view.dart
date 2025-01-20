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
            coffees: [],
          ),
        ),
      ],
    );
  }
}
