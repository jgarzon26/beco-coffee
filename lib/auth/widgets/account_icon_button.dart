import 'package:flutter/material.dart';

class AccountIconButton extends StatelessWidget {
  final String asset;
  final VoidCallback onPressed;

  const AccountIconButton({
    super.key,
    required this.asset,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        asset,
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.height * 0.04,
      ),
    );
  }
}