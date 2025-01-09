import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';

class SearchResultTile extends StatelessWidget {
  final String title, company, imgSrc;
  final double price, avgRating;
  final double? discountPrice;

  const SearchResultTile({
    super.key,
    required this.title,
    required this.company,
    required this.imgSrc,
    required this.price,
    required this.avgRating,
    this.discountPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: kCoffeeCardBackground,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          const Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Placeholder(),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$price\$',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 20,
                          ),
                    ),
                    const SizedBox(width: 15),
                    discountPrice != null
                        ? Text(
                            '$discountPrice\$',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontSize: 20,
                                ),
                          )
                        : const Text(''),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: kRatingColor,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '$avgRating Rating',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 30,
                  width: 109,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 4, 95, 1),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      company,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
