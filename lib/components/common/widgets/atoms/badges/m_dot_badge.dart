import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/constants/m_colors.dart';

class MDotBadge extends StatelessWidget {
  final double? size;
  final Color? badgeColor;

  const MDotBadge({
    Key? key,
    this.size = 6,
    this.badgeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: badgeColor ?? MColors.red[400]!,
      ),
    );
  }
}
