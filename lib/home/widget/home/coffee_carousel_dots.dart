import 'package:beco_coffee/home/controller/carousel_notifier.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoffeeCarouselDots extends ConsumerWidget {
  const CoffeeCarouselDots({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coffeeCarousel = ref.watch(carouselNotifierProvider);

    return DotsIndicator(
      dotsCount: coffeeCarousel.coffeeImages.length,
      position: coffeeCarousel.currentImageIndex,
      decorator: const DotsDecorator(
        size: Size(15, 5),
        activeSize: Size(25, 5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        spacing: EdgeInsets.only(right: 2),
      ),
    );
  }
}
