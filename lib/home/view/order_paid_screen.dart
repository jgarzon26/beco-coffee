import 'package:beco_coffee/home/controller/cart_notifier.dart';
import 'package:beco_coffee/home/controller/order_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class OrderPaidScreen extends ConsumerWidget {
  const OrderPaidScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderRef = ref.watch(orderNotifierProvider.future);
    final cartRef = ref.watch(cartNotifierProvider.future);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Container(
      color: Colors.white,
      child: FutureBuilder(
        future: Future.wait([
          orderRef,
          cartRef,
        ]),
        builder: (context, snapshot) {
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Spacer(),
                Icon(
                  Icons.check_circle_outline_outlined,
                  size: MediaQuery.sizeOf(context).height * 0.25,
                  color: const Color.fromRGBO(228, 0, 82, 1),
                ),
                const Gap(20),
                Text(
                  'Your order is paid',
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                const Gap(20),
                Text(
                  'You can track order below',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                    onPressed: () {
                      context.goNamed('waiting');
                    },
                    child: const Text(
                      'Let\'s Cook',
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
