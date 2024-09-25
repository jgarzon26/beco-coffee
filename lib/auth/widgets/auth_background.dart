import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget? child;

  const AuthBackground({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/img/auth_background.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        if (child != null) child!,
      ],
    );
  }
}
