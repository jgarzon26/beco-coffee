import 'package:beco_coffee/home/widget/pickup_delivery/process_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProcessScreen(
      processMode: 'Delivery',
      processImg: 'assets/img/coffee_status/delivery.png',
      processTitle: 'Delivery Pickup',
      processStatus: 'Wait',
      processDesc: 'Please wait this process',
      onPressed: () {
        context.goNamed('track-order');
      },
      processTitleColor: const Color.fromRGBO(255, 4, 95, 1),
    );
  }
}
