import 'package:beco_coffee/common/favorite_button.dart';
import 'package:flutter/material.dart';

class CoffeesSelection extends StatelessWidget {
  const CoffeesSelection({super.key});

  @override
  Widget build(BuildContext context) {
    const ratingColor = Color.fromRGBO(255, 193, 0, 1);

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
                return Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Stack(
                          children: [
                            Placeholder(),
                            Positioned(
                              top: 0.5,
                              right: 0.5,
                              child: FavoriteButton(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Coffee Name',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            '5.50\$',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                          Text(
                            '3.50\$',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                            5,
                            (index) {
                              return Expanded(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                      color: index < 2 // Average Rating
                                          ? ratingColor
                                          : Colors.black.withOpacity(0.1),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Text(
                            '34 rating',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: ratingColor,
                                    ),
                          ),
                        ],
                      ),
                    ],
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
