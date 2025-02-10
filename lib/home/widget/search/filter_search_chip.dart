import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';

class FilterSearchChip extends StatelessWidget {
  final String label;
  final void Function(bool value) onSelected;
  final bool isSelected;

  const FilterSearchChip({
    super.key,
    required this.label,
    required this.onSelected,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      backgroundColor:
          isSelected ? kSecondaryContainer : Colors.black.withOpacity(0.8),
      side: const BorderSide(
        color: Colors.transparent,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      label: Text(
        label,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.white,
            ),
      ),
      onSelected: (value) {
        if (isSelected == true) {
          onSelected(false);
          return;
        }
        onSelected(value);
      },
    );
  }
}
