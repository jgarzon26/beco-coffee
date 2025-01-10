import 'package:beco_coffee/home/model/order.dart';
import 'package:flutter/material.dart';

class ProductOrderDetail extends StatefulWidget {
  const ProductOrderDetail({super.key});

  @override
  State<ProductOrderDetail> createState() => _ProductOrderDetailState();
}

class _ProductOrderDetailState extends State<ProductOrderDetail> {
  CoffeeSize? coffeeSize;
  CoffeeSugar? coffeeSugar;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 10),
        Row(
          children: CoffeeSize.values.map(
            (size) {
              return Expanded(
                child: Row(
                  children: [
                    Radio.adaptive(
                      toggleable: true,
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: size,
                      groupValue: coffeeSize,
                      onChanged: (value) {
                        setState(() {
                          coffeeSize = value;
                        });
                      },
                    ),
                    const SizedBox(width: 10),
                    Text(
                      size.name[0].toUpperCase() + size.name.substring(1),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
        const SizedBox(height: 10),
        Text(
          'Sugar',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            ...CoffeeSugar.values.map(
              (sugar) {
                return Expanded(
                  child: Row(
                    children: [
                      Radio.adaptive(
                        toggleable: true,
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: sugar,
                        groupValue: coffeeSugar,
                        onChanged: (value) {
                          setState(() {
                            coffeeSugar = value;
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${sugar.name.substring(1)}%',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
