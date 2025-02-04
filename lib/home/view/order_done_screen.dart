import 'package:beco_coffee/home/controller/checkout_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class OrderDoneScreen extends StatelessWidget {
  const OrderDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (_, WidgetRef ref, __) {
            final mode = ref
                .watch(checkoutNotifierProvider.select((value) => value.mode));
            return Text(mode.name[0].toUpperCase() + mode.name.substring(1));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const Gap(10),
            Icon(
              Icons.check_circle_outline_outlined,
              size: MediaQuery.sizeOf(context).height * 0.2,
              color: const Color.fromRGBO(228, 0, 82, 1),
            ),
            const Gap(10),
            Text(
              'Your order is successfully done',
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 2),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: Theme.of(context).textTheme.titleLarge,
                      ),
                      onPressed: () {
                        context.goNamed('home');
                      },
                      child: const Text('Skip'),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.titleLarge,
                      ),
                      onPressed: () {
                        //TODO: go to review screen
                      },
                      child: const Text('Go Review'),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
