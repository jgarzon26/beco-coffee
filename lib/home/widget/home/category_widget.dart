import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const CategoryWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? const Color.fromRGBO(255, 4, 95, 1) : null,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: isSelected
                ? [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Placeholder(),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: isSelected ? FontWeight.w900 : null,
                      fontSize: isSelected ? 18 : null,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
