import 'package:beco_coffee/home/controller/carousel_notifier.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoffeeCarousel extends ConsumerWidget {
  const CoffeeCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCarousel = ref.watch(carouselNotifierProvider);

    return CarouselSlider(
      items: currentCarousel.coffeeImages
          .map(
            (image) => Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  '$image',
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          ref.read(carouselNotifierProvider.notifier).changeImageIndex(index);
        },
      ),
    );
  }
}
