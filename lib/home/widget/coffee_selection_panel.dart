import 'package:beco_coffee/common/favorite_button.dart';
import 'package:flutter/material.dart';

class CoffeeSelectionPanel extends StatelessWidget {
  final String name, imageSrc;
  final int avgRating, numberOfRating;
  final double price;
  final double? discountPrice;

  const CoffeeSelectionPanel({
    super.key,
    required this.name,
    required this.price,
    required this.imageSrc,
    required this.avgRating,
    required this.numberOfRating,
    this.discountPrice,
  });

  @override
  Widget build(BuildContext context) {
    const ratingColor = Color.fromRGBO(255, 193, 0, 1);

    final ratingClamp = avgRating.clamp(1, 5);

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
            name,
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
                '$price\$',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      decoration: discountPrice != null
                          ? TextDecoration.lineThrough
                          : null,
                    ),
              ),
              discountPrice != null
                  ? Text(
                      '$discountPrice\$',
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  : const SizedBox(),
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
                          color: index <= ratingClamp - 1 // Average Rating
                              ? ratingColor
                              : Colors.black.withOpacity(0.1),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Text(
                '$numberOfRating rating',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ratingColor,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
