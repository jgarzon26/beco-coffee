import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomFormFieldFormat extends StatelessWidget {
  final String? labelText;
  final String? valueText;
  final Widget? suffixButton;

  const CustomFormFieldFormat({
    super.key,
    this.labelText,
    this.valueText,
    this.suffixButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black54),
        ),
      ),
      child: Row(
        children: [
          Text(
            labelText ?? '',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black87,
                ),
          ),
          const Spacer(),
          if (valueText != null)
            Text(
              valueText!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                  ),
            ),
          const Gap(5),
          if (suffixButton != null) suffixButton!,
        ],
      ),
    );
  }
}
