import 'package:flutter/material.dart';

class InformationTile {
  final IconData? icon;
  final String? imageSrc;
  final String title;
  final String value;
  const InformationTile({
    this.icon,
    this.imageSrc,
    required this.title,
    required this.value,
  });
}