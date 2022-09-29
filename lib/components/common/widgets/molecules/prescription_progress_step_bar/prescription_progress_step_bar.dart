import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/constants/m_colors.dart';
import 'package:medibuddy_ui_kit/constants/prescription_progress_step_bar/prescription_progress_step_bar_enum.dart';
import 'package:medibuddy_ui_kit/constants/text/m_text_styles.dart';
import 'package:medibuddy_ui_kit/util/prescription_progress_step_bar_util.dart';

class PrescriptionProgressStepBar extends StatefulWidget {
  final String step;
  final bool isPrescriptionIssued;

  const PrescriptionProgressStepBar({
    Key? key,
    required this.step,
    required this.isPrescriptionIssued,
  }) : super(key: key);

  @override
  _PrescriptionProgressStepBarState createState() => _PrescriptionProgressStepBarState();
}

class _PrescriptionProgressStepBarState extends State<PrescriptionProgressStepBar> with PrescriptionProgressStepBarUtil {

  Map<String, dynamic> colorsAndStepValue = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    colorsAndStepValue = setColorsAndStepValue(
      stepValueToString: widget.step,
      isPrescriptionIssued: widget.isPrescriptionIssued,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 32,
      child: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: MColors.gray[100]!,
              ),
              child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    LinearProgressIndicator(
                      minHeight: 8,
                      valueColor: AlwaysStoppedAnimation<Color>(MColors.blue[400]!),
                      backgroundColor: Colors.transparent,
                      value: colorsAndStepValue['stepToDouble'],
                    ),
                    Positioned.fill(
                      top: -24,
                      child: _buildMainStepCircles(),
                    ),
                  ]
              ),
            ),
            _buildHalfStepCircles()
          ]
      ),
    );
  }

  Row _buildMainStepCircles() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStep(labelText: "진료접수"),
        _buildStep(labelText: "병원진료"),
        _buildStep(labelText: "조제접수"),
        _buildStep(labelText: "약 받기"),
      ],
    );
  }

  Column _buildStep({required String labelText}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildProgressLabel(labelText: labelText,),
        _buildCircleDot(color: colorsAndStepValue['mainStepCircle']![prescriptionLabelPosition[labelText]]!),
      ],
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
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        // color: enabled ?? MColors.blue[800]!,
        color: color,
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }

  Widget _buildProgressLabel({required String labelText,}) {
    return Text(
      labelText,
      style: MTextStyles.bold[14]!.copyWith(
        color: colorsAndStepValue['stepLabel']![prescriptionLabelPosition[labelText]],
      ),
      // textAlign: TextAlign.center,
    );
  }
}
