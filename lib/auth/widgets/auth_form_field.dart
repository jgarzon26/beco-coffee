import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  final String label;
  final IconData? iconData;
  final Widget? icon;
  final String? initialValue;
  final TextInputType? keyBoardType;
  final bool obscureText;
  final FormFieldValidator<String?>? validator;
  final void Function(String? newValue)? onSaved;

  const AuthFormField({
    super.key,
    required this.label,
    this.iconData,
    this.icon,
    this.initialValue,
    this.validator,
    this.onSaved,
    this.keyBoardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget suffixIcon;

    if (icon == null) {
      suffixIcon = Icon(
        iconData,
      );
    } else {
      suffixIcon = icon!;
    }

    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyBoardType,
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
          hintText: label,
          suffix: suffixIcon,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          )),
    );
  }
}
