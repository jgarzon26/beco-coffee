import 'package:beco_coffee/home/widget/home/coffee_carousel.dart';
import 'package:beco_coffee/home/widget/home/coffee_carousel_dots.dart';
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
      ],
    );
  }
}
