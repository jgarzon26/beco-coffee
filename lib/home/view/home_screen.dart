import 'package:beco_coffee/home/widget/home/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 20),
          sliver: SliverToBoxAdapter(
            child: CoffeeCarousel(),
          ),
        ),
        SliverToBoxAdapter(
          child: CoffeeCarouselDots(),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          sliver: SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                CategoriesSelection(),
                CoffeesSelection(),
                SizedBox(height: 10),
                Promotions(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
