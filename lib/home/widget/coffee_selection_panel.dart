import 'package:beco_coffee/common/favorite_button.dart';
import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoffeeSelectionPanel extends StatelessWidget {
  final Coffee coffee;

  const CoffeeSelectionPanel({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    final ratingClamp = coffee.rating.clamp(1, 5);

    return GestureDetector(
      onTap: () {
        context.pushNamed('product-detail', extra: coffee);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: kCoffeeCardBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Hero(
                    tag: coffee.coffeeId,
                    child: const Placeholder(),
                  ),
                  const Positioned(
                    top: 0.5,
                    right: 0.5,
                    child: FavoriteButton(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              coffee.name,
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
                  '${coffee.price}\$',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        decoration: coffee.discountPrice != null
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                ),
                coffee.discountPrice != null
                    ? Text(
                        '${coffee.discountPrice}\$',
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
                                ? kRatingColor
                                : Colors.black.withOpacity(0.1),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Text(
                  '${coffee.numberOfRatings} rating',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: kRatingColor,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
