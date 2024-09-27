import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';

final kLabelIconColor = Colors.black.withOpacity(0.3);

class AuthFormField extends StatefulWidget {
  final String label;
  final IconData? iconData;
  final Widget? icon;
  final String? initialValue;
  final TextInputType? keyBoardType;
  final bool obscureText;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String?>? validator;
  final void Function(String? newValue)? onSaved;
  final bool shouldIconDisappearOnEdit;
  final String? errorText;

  const AuthFormField({
    super.key,
    required this.label,
    this.iconData,
    this.icon,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.keyBoardType,
    this.obscureText = false,
    this.shouldIconDisappearOnEdit = true,
    this.errorText,
  });

  @override
  State<AuthFormField> createState() => _AuthFormFieldState();
}

class _AuthFormFieldState extends State<AuthFormField> {
  bool _disappear = false;

  @override
  Widget build(BuildContext context) {
    Widget? suffixIcon;

    if (widget.icon == null) {
      suffixIcon = Icon(
        widget.iconData,
      );
    } else {
      suffixIcon = widget.icon;
    }

    return TextFormField(
      initialValue: widget.initialValue,
      keyboardType: widget.keyBoardType,
      obscureText: widget.obscureText,
      validator: widget.validator,
      forceErrorText: widget.errorText,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }

        if (!widget.shouldIconDisappearOnEdit) return;

        if (value.trim().isNotEmpty) {
          if (_disappear == false) {
            setState(() {
              _disappear = true;
            });
          }
        } else {
          setState(() {
            _disappear = false;
          });
        }
      },
      onSaved: widget.onSaved,
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: kSecondaryContainer,
            ),
        hintText: widget.label,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: kLabelIconColor,
            ),
        suffixIcon: !_disappear ? suffixIcon : null,
        suffixIconColor: kLabelIconColor,
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
