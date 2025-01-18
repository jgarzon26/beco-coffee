import 'package:flutter/material.dart';

class ItemCounter extends StatefulWidget {
  final int? initialCount;
  final void Function(int counter)? onChange;

  const ItemCounter({
    super.key,
    this.initialCount,
    this.onChange,
  });

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  late int counter;

  @override
  void initState() {
    super.initState();
    setState(() {
      counter = widget.initialCount ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          constraints: const BoxConstraints(
            maxHeight: 40,
            maxWidth: 40,
          ),
          padding: EdgeInsets.zero,
          style: IconButton.styleFrom(
            disabledBackgroundColor: Colors.black.withOpacity(0.5),
            disabledForegroundColor: Colors.white,
            foregroundColor: Colors.white,
            backgroundColor: Colors.black.withOpacity(0.8),
          ),
          onPressed: counter > 1
              ? () {
                  setState(() {
                    counter--;
                  });
                  if (widget.onChange != null) {
                    widget.onChange!(counter);
                  }
                }
              : null,
          icon: const Icon(
            Icons.remove,
          ),
        ),
        Text(
          counter.toString(),
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        IconButton(
          constraints: const BoxConstraints(
            maxHeight: 40,
            maxWidth: 40,
          ),
          padding: EdgeInsets.zero,
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black.withOpacity(0.8),
          ),
          onPressed: () {
            setState(() {
              counter++;
            });
            if (widget.onChange != null) {
              widget.onChange!(counter);
            }
          },
          icon: const Icon(
            Icons.add,
          ),
        ),
      ],
    );
  }
}
