import 'package:flutter/material.dart';

class MIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;

  const MIcon._({
    Key? key,
    required this.icon,
    required this.size,
    this.color = Colors.black,
  }) : super(key: key);

  factory MIcon.bold({
    Key? key,
    required icon,
    Color? color,
  }) {
    return MIcon._(
      icon: icon,
      size: 16,
      color: color,
    );
  }

  factory MIcon.regular({
    Key? key,
    required icon,
    Color? color,
  }) {
    return MIcon._(
      icon: icon,
      size: 24,
      color: color,
    );
  }

  factory MIcon.light({
    Key? key,
    required icon,
    Color? color,
  }) {
    return MIcon._(
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
