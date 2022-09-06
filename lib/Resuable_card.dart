import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      { this.colour,
      this.cardChild,
      this.containerHeight,
      this.containerWidth});

  final Color? colour;
  final Widget? cardChild;
  final double? containerHeight;
  final double? containerWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      height: containerHeight,
      width: containerWidth,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
