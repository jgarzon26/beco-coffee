import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';

Widget loadingImageBuilder(BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
  if (loadingProgress == null) {
      return child;
    }

    return Center(
      child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation(kPrimaryContainer),
          value: loadingProgress.cumulativeBytesLoaded /
              loadingProgress.expectedTotalBytes!),
    );
}
