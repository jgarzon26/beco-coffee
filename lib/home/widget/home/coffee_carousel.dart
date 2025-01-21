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
      items: currentCarousel.when(
        data: (carousel) {
          return carousel.coffeeImages.map(
            (coffee) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                      coffee.image_src,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ).toList();
        },
        error: (error, stackTrace) {
          return null;
        },
        loading: () {
          return List.generate(
            5,
            (image) => Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          );
        },
      ),
      options: CarouselOptions(
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          ref.read(carouselNotifierProvider.notifier).changeImageIndex(index);
        },
      ),
    );
  }
}
