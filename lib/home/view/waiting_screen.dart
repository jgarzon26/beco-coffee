import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/carbon.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Platform.isIOS ? CupertinoIcons.back : Icons.arrow_back,
            size: 30,
          ),
        ),
        title: const Text('Waiting'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/coffee_status/cooking.png',
              fit: BoxFit.cover,
              width: MediaQuery.sizeOf(context).width * 0.5,
            ),
            const Gap(40),
            Text(
              'Cooking',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const Gap(40),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: MediaQuery.sizeOf(context).height * 0.1,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                onPressed: () {
                  //TODO: Go to either pickup or deliver
                },
                child: const Text('10 minutes'),
              ),
            ),
            const Gap(20),
            Text(
              'Please wait this process',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(228, 0, 82, 1),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: const CircleBorder(),
          onPressed: () {
            //TODO: go to chat
          },
          child: const Iconify(
            Carbon.chat_bot,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
