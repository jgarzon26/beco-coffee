import 'package:flutter/material.dart';

class Promotions extends StatelessWidget {
  const Promotions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Promotion',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 1,
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.grey,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
