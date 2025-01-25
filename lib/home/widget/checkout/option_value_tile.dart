import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OptionValueTile extends StatelessWidget {
  const OptionValueTile({
    super.key,
    this.leadingIconSize = 20,
    required this.optionTitle,
    this.iconColor,
    this.textColor,
  });

  final double leadingIconSize;
  final String optionTitle;
  final Color? iconColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(10),
        Stack(
          children: [
            Container(
              width: leadingIconSize,
              height: leadingIconSize,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: CircleBorder(),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: leadingIconSize / 2,
                  height: leadingIconSize / 2,
                  decoration: ShapeDecoration(
                    color: iconColor ?? kSecondaryContainer,
                    shape: const CircleBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          optionTitle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
