/* Developed by Eng Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'hand.dart';

class ContainerHand extends Hand {
  const ContainerHand({
    Key? key,
    required Color color,
    required double size,
    required double angleRadians,
    this.child,
  }) : super(
          key: key,
          color: color,
          size: size,
          angleRadians: angleRadians,
        );
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: Transform.rotate(
          angle: angleRadians,
          alignment: Alignment.center,
          child: Transform.scale(
            scale: size,
            alignment: Alignment.center,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
