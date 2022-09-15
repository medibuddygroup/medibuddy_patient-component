import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/constants/icon/m_icon_enum.dart';

class MIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;
  final IconType? type;

  const MIcon._({
    Key? key,
    required this.icon,
    this.size,
    this.color = Colors.black,
    this.type,
  }) : super(key: key);

  factory MIcon.bold({
    Key? key,
    required icon,
    Color? color,
  }) {
    return MIcon._(
      icon: icon,
      color: color,
      type: IconType.bold,
    );
  }

  factory MIcon.regular({
    Key? key,
    required icon,
    Color? color,
  }) {
    return MIcon._(
      icon: icon,
      color: color,
      type: IconType.regular,
    );
  }

  factory MIcon.light({
    Key? key,
    required icon,
    Color? color,
  }) {
    return MIcon._(
      icon: icon,
      color: color,
      type: IconType.light,
    );
  }

  factory MIcon({
    Key? key,
    required icon,
    required double size,
    Color? color,
  }) {
    return MIcon._(
      icon: icon,
      size: size,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size ?? iconSizeFromType[type],
      color: color,
    );
  }
}
