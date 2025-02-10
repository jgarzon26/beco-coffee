import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/carbon.dart';

class ProcessScreen extends StatelessWidget {
  final String processTitle,
      processDesc,
      processStatus,
      processImg,
      processMode;
  final Color? processTitleColor;
  final VoidCallback? onPressed;

  const ProcessScreen({
    super.key,
    required this.processMode,
    required this.processImg,
    required this.processTitle,
    required this.processStatus,
    required this.processDesc,
    this.onPressed, this.processTitleColor,
  });

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
        title: Text(processMode),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              processImg,
              fit: BoxFit.cover,
              width: MediaQuery.sizeOf(context).width * 0.5,
            ),
            const Gap(40),
            Text(
              processTitle,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: processTitleColor,
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
                onPressed: onPressed,
                child: Text(processStatus),
              ),
            ),
            const Gap(20),
            Text(
              processDesc,
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
