import 'dart:io';

import 'package:flutter/material.dart';

class CategoriesSelection extends StatelessWidget {
  const CategoriesSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        child: AspectRatio(
                          aspectRatio: 2 / 3,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              //color: Color.fromRGBO(255, 4, 95, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Placeholder(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Icon(
                Platform.isIOS ? Icons.arrow_forward_ios : Icons.arrow_right,
                size: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
