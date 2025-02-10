import 'package:beco_coffee/home/controller/checkout_notifier.dart';
import 'package:beco_coffee/home/model/checkout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:beco_coffee/home/widget/pickup_delivery/process_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WaitingScreen extends ConsumerWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkoutMode =
        ref.watch(checkoutNotifierProvider.select((checkout) => checkout.mode));

    return ProcessScreen(
      processMode: 'Waiting',
      processImg: 'assets/img/coffee_status/cooking.png',
      processTitle: 'Cooking',
      processStatus: '10 minutes',
      processDesc: 'Please wait this process',
      onPressed: () {
        final pathName = switch (checkoutMode) {
          CheckoutMode.pickup => 'pickup-done',
          CheckoutMode.delivery => 'delivery',
        };

        context.goNamed(pathName);
      },
    );
  }
}
