import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/widget/coffee_selection_panel.dart';
import 'package:flutter/material.dart';

class CoffeeGridView extends StatelessWidget {
  final List<Coffee> coffees;
  final bool isScrollable;

  const CoffeeGridView({
    super.key,
    required this.coffees,
    this.isScrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: isScrollable ? null : const NeverScrollableScrollPhysics(),
      itemCount: coffees.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 20,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (context, index) {
        return CoffeeSelectionPanel(
          coffee: coffees[index],
        );
      },
    );
  }
}
