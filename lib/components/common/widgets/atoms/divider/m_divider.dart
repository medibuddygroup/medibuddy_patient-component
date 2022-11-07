import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/constants/m_colors.dart';

class MDivider extends StatelessWidget {

  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsets? margin;

  const MDivider._({
    Key? key,
    this.width,
    this.height,
    this.color,
    this.margin,
  }) : super(key: key);

  factory MDivider.horizontal({
    Key? key,
    double width = double.infinity,
    double height = 1,
    Color? color,
    EdgeInsets? margin,
  }) {
    return MDivider._(
      width: width,
      height: height,
      color: color ?? MColors.gray[200]!,
      margin: margin,
    );
  }

  factory MDivider.vertical({
    Key? key,
    double width = 1,
    double height = 16,
    Color? color,
    EdgeInsets? margin,
  }) {
    return MDivider._(
      width: width,
      height: height,
      color: color ?? MColors.gray[200]!,
      margin: margin,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      margin: margin,
    );
  }
}
