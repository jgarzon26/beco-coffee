import 'package:beco_coffee/home/widget/checkout/option_value_tile.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String optionTitle;
  final VoidCallback? onPressed;
  final bool isSelected;

  const OptionButton({
    super.key,
    required this.optionTitle,
    this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: isSelected ? kPrimaryContainer : Colors.black12,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        minimumSize: const Size.fromHeight(30),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: OptionValueTile(
          leadingIconSize: 30,
          optionTitle: optionTitle,
          iconColor: !isSelected ? Colors.white : null,
        ),
      ),
    );
  }
}
