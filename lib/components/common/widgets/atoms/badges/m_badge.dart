import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/constants/m_colors.dart';
import 'package:medibuddy_ui_kit/constants/text/m_text_styles.dart';

class MBadge extends StatelessWidget {
  final double? height;
  final String status;
  final bool isHospital;
  final Color backgroundColor;
  final Color textColor;

  const MBadge._({
    Key? key,
    required this.status,
    required this.isHospital,
    required this.backgroundColor,
    required this.textColor,
    this.height = 24,
  }) : super(key: key);


  factory MBadge.open({
    required bool isHospital,
  }) {
    return MBadge._(
      status: isHospital ? '진료 중' : '영업 중',
      isHospital: isHospital,
      backgroundColor: MColors.blue[50]!,
      textColor: MColors.blue[800]!,
    );
  }

  factory MBadge.closed({
    required bool isHospital,
  }) {
    return MBadge._(
      status: isHospital ? '진료 종료' : '영업 종료',
      isHospital: isHospital,
      backgroundColor: MColors.gray[60]!,
      textColor: MColors.gray[600]!,
    );
  }

  factory MBadge.lunch({
    required bool isHospital,
  }) {
    return MBadge._(
      status: '점심 시간',
      isHospital: isHospital,
      backgroundColor: MColors.gray[60]!,
      textColor: MColors.gray[600]!,
    );
  }

  factory MBadge.inStock({
    required bool isHospital,
  }) {
    return MBadge._(
      status: '재고 있음',
      isHospital: isHospital,
      backgroundColor: MColors.green[50]!,
      textColor: MColors.green[600]!,
    );
  }

  factory MBadge.noStock({
    required bool isHospital,
  }) {
    return MBadge._(
      status: '재고 없음',
      isHospital: isHospital,
      backgroundColor: MColors.red[50]!,
      textColor: MColors.red[600]!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: backgroundColor,
      ),
      child: Text(
        status,
        style: MTextStyles.bold[14]!.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
