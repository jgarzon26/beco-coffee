import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';

class AuthHelpRow extends StatelessWidget {
  const AuthHelpRow({
    super.key,
    required this.questionText,
    required this.label,
    this.onPressed,
  });

  final String questionText;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: kOnPrimaryContainer,
              ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(left: 5),
            alignment: Alignment.centerLeft,
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: kSecondaryContainer,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}