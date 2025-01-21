import 'dart:io';

import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/widget/product%20detail/product_order_detail.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends StatelessWidget {
  final Coffee coffee;

  const ProductDetailScreen({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Hero(
                  tag: coffee.coffee_id,
                  child: Image.network(
                    coffee.image_src,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).padding.top,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Row(
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(
                        Platform.isIOS
                            ? Icons.arrow_back_ios_new
                            : Icons.arrow_back,
                        size: 40,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        coffee.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        '${coffee.number_of_ratings} rating',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: const Color.fromRGBO(255, 193, 0, 1),
                                ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    coffee.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${coffee.price}\$',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: kSecondaryContainer.withOpacity(0.7),
                              decoration: coffee.discount_price != null
                                  ? TextDecoration.lineThrough
                                  : null,
                              decorationColor:
                                  kSecondaryContainer.withOpacity(0.7),
                            ),
                      ),
                      if (coffee.discount_price != null)
                        Text(
                          'Discount',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      if (coffee.discount_price != null)
                        Text(
                          '${coffee.discount_price}\$',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: kSecondaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                        )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const ProductOrderDetail(),
                  const Spacer(flex: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: kPrimaryContainer),
                            foregroundColor: kPrimaryContainer,
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Add Cart',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: kPrimaryContainer,
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Buy Now',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: kOnPrimaryContainer,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
