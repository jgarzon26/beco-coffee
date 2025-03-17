import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AboutUsTemplate extends StatelessWidget {
  final String title;
  final List<String> body;

  const AboutUsTemplate({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          itemBuilder: (context, index) => Text(body[index]),
          separatorBuilder: (context, index) => const Gap(10),
          itemCount: body.length,
        ),
      ),
    );
  }
}
