import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    this.isAuthButtonEnable = true,
    required this.formKey,
    required this.constraints,
    required this.text,
    this.onPressed,
  });

  final bool isAuthButtonEnable;
  final GlobalKey<FormState> formKey;
  final BoxConstraints constraints;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth * 0.8,
      height: constraints.maxHeight * 0.05,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryContainer,
          foregroundColor: kOnPrimaryContainer,
          disabledBackgroundColor: Colors.black54,
          disabledForegroundColor: Colors.white38,
          textStyle: Theme.of(context).textTheme.headlineSmall,
        ),
        onPressed: isAuthButtonEnable
            ? () {
                if (!formKey.currentState!.validate()) {
                  return;
                }
                formKey.currentState!.save();
                if (onPressed != null) onPressed!();
              }
            : null,
        child: Text(text),
      ),
    );
  }
}
