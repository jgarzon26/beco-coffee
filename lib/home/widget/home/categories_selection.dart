import 'dart:io';

import 'package:beco_coffee/home/widget/home/category_widget.dart';
import 'package:flutter/material.dart';

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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CategoryWidget(
                        title: 'Coffee',
                        onTap: () {
                          setState(() {
                            currentSelection = index;
                          });
                        },
                        isSelected: currentSelection == index,
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
