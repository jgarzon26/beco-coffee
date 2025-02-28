import 'package:beco_coffee/home/model/order.dart';
import 'package:beco_coffee/home/repo/coffee_repo.dart';
import 'package:beco_coffee/home/widget/order/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late final List<String> filterLabels;
  OrderStatus? orderStatus;

  List<String> initFilters() {
    const filters = OrderStatus.values;

    return filters.map((filter) {
      final label = filter.name;
      var modified = label.replaceAllMapped(
        RegExp(r'(?<!^)([A-Z])'),
        (match) => ' ${match[0]}',
      );
      if (modified.isNotEmpty) {
        modified = modified[0].toUpperCase() + modified.substring(1);
      }

      return modified;
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    filterLabels = initFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: filterLabels.map(
              (filter) {
                final type = OrderStatus.values[filterLabels.indexOf(filter)];
                return Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: FilterChip(
                    selected: orderStatus == type,
                    label: Text(filter),
                    showCheckmark: false,
                    onSelected: (value) {
                      if (value) {
                        setState(() {
                          orderStatus = type;
                        });
                      } else {
                        setState(() {
                          orderStatus = null;
                        });
                      }
                    },
                  ),
                );
              },
            ).toList(),
          ),
          const Gap(10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Pending Orders',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const Gap(10),
          //? This is only temporary, should get orders from order database
          Consumer(
            builder: (context, ref, child) {
              return FutureBuilder(
                  future: ref
                      .watch(coffeeRepoProvider)
                      .getCoffeeById('9b86d881-b02d-431d-98e7-b4c0edccaee5'),
                  builder: (context, snapshot) {

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Expanded(
                        child:
                            Center(child: CircularProgressIndicator.adaptive()),
                      );
                    }

                    if (snapshot.hasError) {
                      return const Text('Error');
                    }

                    final tempCoffee = snapshot.data!;

                    return Expanded(
                      child: ListView(
                        children: [
                          OrderTile(
                            coffee: tempCoffee,
                            status: OrderStatus.process,
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
