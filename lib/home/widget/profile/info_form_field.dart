import 'package:flutter/material.dart';

class InfoFormField extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final String? errorText;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onSaved;

  const InfoFormField({
    super.key,
    required this.labelText,
    required this.initialValue,
    this.errorText,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}