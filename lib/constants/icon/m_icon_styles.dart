import 'package:flutter/material.dart';

class MIconStyles extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;

  const MIconStyles._({
    Key? key,
    required this.icon,
    required this.size,
    this.color = Colors.black,
  }) : super(key: key);

  factory MIconStyles.bold({
    Key? key,
    required icon,
    Color? color,
  }) {
    return MIconStyles._(
      icon: icon,
      size: 16,
      color: color,
    );
  }

  factory MIconStyles.regular({
    Key? key,
    required icon,
    Color? color,
  }) {
    return MIconStyles._(
      icon: icon,
      size: 24,
      color: color,
    );
  }

  factory MIconStyles.light({
    Key? key,
    required icon,
    Color? color,
  }) {
    return MIconStyles._(
      icon: icon,
      size: 32,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
