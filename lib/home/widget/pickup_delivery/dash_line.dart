import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  const DashLine({
    super.key,
    this.height = 1,
    this.color = Colors.grey,
    this.width = 10,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (2 * width)).floor();
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            dashCount,
            (index) {
              return SizedBox(
                width: width,
                height: height,
                child: DecoratedBox(decoration: BoxDecoration(color: color)),
              );
            },
          ),
        );
      },
    );
  }
}
