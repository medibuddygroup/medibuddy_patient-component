import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/constants/m_colors.dart';
import 'package:medibuddy_ui_kit/constants/prescription_progress_step_bar/prescription_progress_step_bar_enum.dart';
import 'package:medibuddy_ui_kit/constants/text/m_text_styles.dart';
import 'package:medibuddy_ui_kit/util/prescription_progress_step_bar_util.dart';

class PrescriptionProgressStepBar extends StatefulWidget {
  final String step;
  final bool isPrescriptionIssued;
  final EdgeInsets margin;
  final double outerCircleDiameter;
  final double innerCircleDiameter;
  final double progressBarHeight;

  /// 구속조건 : 메인 스텝 바깥 원 반지름 값 >= 프로그레스 바 높이 값
  const PrescriptionProgressStepBar({
    Key? key,
    required this.step,
    required this.isPrescriptionIssued,
    this.margin = const EdgeInsets.all(16),
    this.outerCircleDiameter = 16,
    this.innerCircleDiameter = 8,
    this.progressBarHeight = 8,
  }) : assert(outerCircleDiameter/2 >= progressBarHeight,
  "메인 스텝 바깥 원 반지름 값은 프로그레스 바 높이 값 보다 크거나 같아야 합니다.")
  , super(key: key);

  @override
  _PrescriptionProgressStepBarState createState() => _PrescriptionProgressStepBarState();
}

class _PrescriptionProgressStepBarState extends State<PrescriptionProgressStepBar> with PrescriptionProgressStepBarUtil {

  Map<String, dynamic> colorsAndStepValue = {};
  double progressBarPositionFromBottom = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    colorsAndStepValue = setColorsAndStepValue(
      stepValueToString: widget.step,
      isPrescriptionIssued: widget.isPrescriptionIssued,
    );
    progressBarPositionFromBottom =
        (widget.outerCircleDiameter/2) - (widget.progressBarHeight/2);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      color: Colors.white,
      margin: widget.margin,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: progressBarPositionFromBottom,
            left: 0,    /// 구속조건
            right: 0,   /// 구속조건
            child: _buildProgressBar(context)
          ),
          _buildStepLabels()
        ],
      ),
    );
  }

  Widget _buildProgressBar(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
            horizontal: widget.progressBarHeight/2,
          ),
          child: LinearProgressIndicator(
            minHeight: widget.progressBarHeight,
            valueColor: AlwaysStoppedAnimation<Color>(MColors.blue[400]!),
            backgroundColor: MColors.gray[100]!,
            value: colorsAndStepValue['progressBarValue'],
          ),
        ),
        Positioned.fill(
          bottom: 0,
          child: _buildHalfStepCircles()
        )
      ],
    );
  }

  Row _buildStepLabels() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildMainStep(labelText: "진료접수"),
        _buildMainStep(labelText: "병원진료"),
        _buildMainStep(labelText: "조제접수"),
        _buildMainStep(labelText: "약 받기"),
      ],
    );
  }

  Column _buildMainStep({required String labelText}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildProgressLabel(labelText: labelText,),
        _buildMainStepCircle(
          outerCircleColor: colorsAndStepValue['mainStepCircle'][prescriptionLabelPosition[labelText]]
        ),
      ],
    );
  }

  Container _buildMainStepCircle({required Color outerCircleColor}) {
    return Container(       /// outer Circle
      alignment: Alignment.center,
      width: widget.outerCircleDiameter,
      height: widget.outerCircleDiameter,
      decoration: BoxDecoration(
        color: outerCircleColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Container(     /// inner Circle
        width: widget.innerCircleDiameter,
        height: widget.innerCircleDiameter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    );
  }

  Row _buildHalfStepCircles() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for(double i=0; i <= 1.0; i+=0.25)
          _buildCircleDot(color: colorsAndStepValue['halfStepCircle']![i]!),
      ],
    );
  }

  Container _buildCircleDot({required Color color}) {
    return Container(
      width: widget.progressBarHeight,
      height: widget.progressBarHeight,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }

  Widget _buildProgressLabel({required String labelText,}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        labelText,
        style: MTextStyles.bold[14]!.copyWith(
          color: colorsAndStepValue['stepLabel']![prescriptionLabelPosition[labelText]],
        ),
        // textAlign: TextAlign.center,
      ),
    );
  }
}
