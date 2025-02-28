import 'package:beco_coffee/common/favorite_button.dart';
import 'package:beco_coffee/common/loading_image_builder.dart';
import 'package:beco_coffee/home/controller/wishlist_notifier.dart';
import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                  AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: Hero(
                        tag: coffee.coffee_id,
                        child: Image.network(
                          coffee.image_src,
                          fit: BoxFit.cover,
                          loadingBuilder: loadingImageBuilder,
                        ),
                      ),
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final wishlists = ref.watch(wishlistNotifierProvider).value ?? [];

                      return Positioned(
                        top: 0.5,
                        right: 0.5,
                        child: FavoriteButton(
                          isFavorite: wishlists.contains(coffee),
                          onToggle: (value) {
                            ref
                                .read(wishlistNotifierProvider.notifier)
                                .toggleCoffeeWishlist(coffee, value);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              coffee.name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
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
                        decoration: coffee.discount_price != null
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                ),
                coffee.discount_price != null
                    ? Text(
                        '${coffee.discount_price}\$',
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
                  '${coffee.number_of_ratings} rating',
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
