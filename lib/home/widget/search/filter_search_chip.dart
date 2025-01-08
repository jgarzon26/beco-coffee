import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';

class FilterSearchChip extends StatefulWidget {
  final String label;
  final void Function(bool value) onSelected;

  const FilterSearchChip({
    super.key,
    required this.label,
    required this.onSelected,
  });

  @override
  State<FilterSearchChip> createState() => _FilterSearchChipState();
}

class _FilterSearchChipState extends State<FilterSearchChip> {
  bool isSelected = false;

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
        widget.label,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.white,
            ),
      ),
      onSelected: (value) {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onSelected(isSelected);
      },
    );
  }
}
