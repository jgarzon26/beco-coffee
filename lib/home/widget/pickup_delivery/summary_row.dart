import 'package:flutter/material.dart';

class SummaryRow extends TableRow {
  final String title;
  final double value;

  static const padding = 5.0;

  SummaryRow({
    super.key,
    required this.title,
    required this.value,
  }) : super(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: padding),
              child: Text(title),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: padding),
              child: Text(
                '$value\$',
                textAlign: TextAlign.right,
              ),
            ),
          ],
        );
}
