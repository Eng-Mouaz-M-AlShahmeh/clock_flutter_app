/* Developed by Eng Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';

abstract class Hand extends StatelessWidget {
  const Hand({
    Key? key,
    required this.color,
    required this.size,
    required this.angleRadians,
  }) : super(key: key);

  final Color color;
  final double size;
  final double angleRadians;
}
