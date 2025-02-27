import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/model/order.dart';
import 'package:beco_coffee/home/repo/coffee_repo.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:transparent_image/transparent_image.dart';

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
                    final tempCoffee = snapshot.data!;

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Expanded(
                        child:
                            Center(child: CircularProgressIndicator.adaptive()),
                      );
                    }

                    if (snapshot.hasError) {
                      return const Text('Error');
                    }

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

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.coffee,
    required this.status,
  });

  final Coffee coffee;
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final statusRecord = switch (status) {
      OrderStatus.onDelivery => ('Delivery', Colors.lime),
      OrderStatus.process => ('Process', const Color.fromRGBO(255, 4, 95, 1)),
      OrderStatus.success => (
          'Completed',
          const Color.fromRGBO(255, 193, 0, 1)
        ),
    };

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.black.withValues(alpha: 0.05),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: coffee.image_src,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Gap(15),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffee.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Gap(5),
                Text(
                  '1 items',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Gap(5),
                Text(
                  '1.5\$',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Gap(5),
                Text(
                  statusRecord.$1,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: statusRecord.$2,
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
