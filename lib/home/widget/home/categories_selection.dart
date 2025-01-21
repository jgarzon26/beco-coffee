import 'dart:io';

import 'package:beco_coffee/home/repo/coffee_repo.dart';
import 'package:beco_coffee/home/widget/home/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesSelection extends StatefulWidget {
  const CategoriesSelection({
    super.key,
  });

  @override
  State<CategoriesSelection> createState() => _CategoriesSelectionState();
}

class _CategoriesSelectionState extends State<CategoriesSelection> {
  int currentSelection = -1;

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
          height: MediaQuery.of(context).size.height * 0.2,
          child: Row(
            children: [
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    final categories = ref.watch(getCategoriesProvider);

                    return categories.when(
                      data: (categories) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CategoryWidget(
                                category: categories[index],
                                onTap: () {
                                  setState(() {
                                    currentSelection = index;
                                  });
                                },
                                isSelected: currentSelection == index,
                              ),
                            );
                          },
                        );
                      },
                      error: (error, stackTrace) => Container(),
                      loading: () => Container(),
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
