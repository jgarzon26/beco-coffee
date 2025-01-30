import 'package:beco_coffee/home/widget/pickup_delivery/process_screen.dart';
import 'package:flutter/material.dart';

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
      onPressed: () {},
      processTitleColor: const Color.fromRGBO(255, 4, 95, 1),
    );
  }
}
