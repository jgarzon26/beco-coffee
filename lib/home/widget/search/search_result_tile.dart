import 'package:beco_coffee/home/controller/search_history_notifier.dart';
import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchResultTile extends StatelessWidget {
  final Coffee coffee;

  const SearchResultTile({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    final companyName = coffee.company.company_name;

    return Consumer(
      builder: (context, ref, child) {
        return GestureDetector(
          onTap: () {
            ref
                .read(searchHistoryNotifierProvider.notifier)
                .addCoffeeToSearchHistory(coffee);
            context.pushNamed('product-detail', extra: coffee);
          },
          child: child,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: kCoffeeCardBackground,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Hero(
                    tag: coffee.coffee_id,
                    child: Image.network(coffee.image_src, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    coffee.name,
                    textAlign: TextAlign.center,
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
                        '${coffee.price}\$',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 20,
                                ),
                      ),
                      const SizedBox(width: 15),
                      coffee.discount_price != null
                          ? Text(
                              '${coffee.discount_price}\$',
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
                        '${coffee.rating} Rating',
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
                        !companyName.contains(' ')
                            ? companyName
                            : companyName.substring(
                                0,
                                companyName.indexOf(' '),
                              ),
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
      ),
    );
  }
}
