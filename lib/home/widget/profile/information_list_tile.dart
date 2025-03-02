import 'package:beco_coffee/common/information_tile.dart';
import 'package:flutter/material.dart';

class InformationListTile extends StatelessWidget {
  final InformationTile info;

  const InformationListTile({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.black54,
          ),
      subtitleTextStyle: Theme.of(context).textTheme.titleLarge,
      leading: Column(
        children: [
          const Spacer(),
          info.icon != null
              ? Icon(
                  info.icon,
                  size: 35,
                )
              : ImageIcon(
                  AssetImage(info.imageSrc ?? ''),
                  size: 35,
                ),
          const Spacer(flex: 3),
        ],
      ),
      title: Text(info.title),
      subtitle: Text(info.value),
    );
  }
}