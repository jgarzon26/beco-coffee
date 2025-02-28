import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final void Function(bool) onToggle;

  const FavoriteButton({
    super.key, required this.isFavorite, required this.onToggle,
  });



  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: Colors.transparent,
      ),
      highlightColor: Colors.transparent,
      onPressed: () {
        onToggle(!isFavorite);
      },
      icon: Icon(
        Icons.favorite,
        color: isFavorite ? const Color.fromRGBO(255, 4, 95, 1) : Colors.white,
        size: 30,
      ),
    );
  }
}
