import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final void Function(bool)? onToggle;

  const FavoriteButton({
    super.key,
    this.onToggle,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: Colors.transparent,
      ),
      highlightColor: Colors.transparent,
      onPressed: () {
        setState(() {
          isPressed = !isPressed;
        });
        if (widget.onToggle != null) {
          widget.onToggle!(isPressed);
        }
      },
      icon: Icon(
        Icons.favorite,
        color: isPressed ? const Color.fromRGBO(255, 4, 95, 1) : Colors.white,
        size: 30,
      ),
    );
  }
}
