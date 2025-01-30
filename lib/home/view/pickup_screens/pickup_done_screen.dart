import 'package:beco_coffee/home/widget/pickup_delivery/process_screen.dart';
import 'package:flutter/material.dart';

class PickupDoneScreen extends StatelessWidget {
  const PickupDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProcessScreen(
      processMode: 'Pickup',
      processImg: 'assets/img/coffee_status/pickup_done.png',
      processTitle: 'Wait Your Pickup',
      processStatus: 'Done',
      processDesc: 'Process done wait your pickup',
      onPressed: () {},
    );
  }
}
