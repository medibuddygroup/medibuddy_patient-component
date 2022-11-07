import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/components/common/widgets/molecules/prescription_progress_step_bar/prescription_progress_step_bar.dart';
import 'package:medibuddy_ui_kit/constants/m_colors.dart';
import 'package:medibuddy_ui_kit/constants/text/m_text_styles.dart';

class TreatmentProgressCard extends StatefulWidget {

  final String patientName;
  final String relation;
  /// TimeStamp format :: yy/MM/dd (day) HH:mm
  final String applyTimeStamp;
  final Map<String, dynamic> prescriptionStatusData;
  final bool isPrescriptionIssued;
  final Function() onTap;

  const TreatmentProgressCard({
    Key? key,
    required this.patientName,
    required this.relation,
    required this.applyTimeStamp,
    required this.prescriptionStatusData,
    required this.isPrescriptionIssued,
    required this.onTap,
  }) : super(key: key);

  @override
  _TreatmentProgressCardState createState() => _TreatmentProgressCardState();
}

class _TreatmentProgressCardState extends State<TreatmentProgressCard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0,0,0,0.25),
                offset: Offset(0, 1),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ]
        ),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildNameAndDateSection(),
            PrescriptionProgressStepBar(
                step: widget.prescriptionStatusData["state"],
                isPrescriptionIssued: widget.isPrescriptionIssued
            ),
            _buildDetailedMessage(),
          ],
        ),
      ),
    );
  }

  Widget _buildNameAndDateSection() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${widget.patientName}(${widget.relation})",
            style: MTextStyles.bold[16]!.copyWith(
              color: MColors.gray[900]!,
            ),
          ),
          Text(
            widget.applyTimeStamp,
            style: MTextStyles.regular[14]!.copyWith(
              color: MColors.gray[500]!,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailedMessage() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          for(int i=0; i<widget.prescriptionStatusData["message"].length; i++)
            _buildMessageContainer(i)
        ],
      )
    );
  }

  Widget _buildMessageContainer(int index) {
    return Container(
      /// TODO: 백엔드 api 정해진 후 작업.
      // child: Html(data: widget.prescriptionStatusData["message"][index]),
    );
  }
}
