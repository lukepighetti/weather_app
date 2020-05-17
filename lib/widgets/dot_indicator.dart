import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  /// The height/width of the bounding box.
  final double dimension;

  /// The diameter of the dot.
  final double diameter;

  /// The color of the dot.
  final Color color;

  const DotIndicator({
    Key key,
    this.dimension = 14,
    this.diameter = 6,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.square(dimension),
      child: Center(
        child: SizedBox.fromSize(
          size: Size.square(diameter),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: color ?? Colors.grey.shade400,
              borderRadius: BorderRadius.circular(999),
            ),
          ),
        ),
      ),
    );
  }
}
