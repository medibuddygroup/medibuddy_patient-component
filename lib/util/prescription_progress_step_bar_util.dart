import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/medibuddy_ui_kit.dart';

class PrescriptionProgressStepBarUtil {

  final Color enabledLabelTextColor = MColors.gray[900]!;
  final Color disabledLabelTextColor = MColors.gray[400]!;
  final Color enabledMainStepCircleColor = MColors.blue[800]!;
  final Color disabledMainStepCircleColor = MColors.gray[40]!;
  final Color enabledHalfStepCircleColor = MColors.blue[400]!;
  final Color disabledHalfStepCircleColor = MColors.gray[100]!;

  double stepValueByPrescriptionStep({
    required PrescriptionStep step,
    required bool isPrescriptionIssued
  }) {
    switch(step) {
      case PrescriptionStep.applyPrescription:
        return 0.125;
      case PrescriptionStep.appointmentTreatment:
      case PrescriptionStep.hospitalPrescriptionReject:
      case PrescriptionStep.patientCancelPrescription:
        return 0.25;
      case PrescriptionStep.onTreatment:
      case PrescriptionStep.paymentErrorOnPrescriptionFee:
        return 0.375;
      case PrescriptionStep.issuePrescription:  /// 찰나의 state.
      case PrescriptionStep.depositPrescriptionFee:
        if(isPrescriptionIssued) return 0.5;
        else return 0.375;
      case PrescriptionStep.sendMedicineFee:    /// 찰나의 state.
      case PrescriptionStep.sendPrescriptionPaperFromPatientToPharm:
      case PrescriptionStep.pharmacyPrescriptionReject:
      case PrescriptionStep.paymentErrorOnMedicineFee:
        return 0.625;
      case PrescriptionStep.depositMedicineFee:
        return 0.75;
      case PrescriptionStep.medicineTaken:
        return 1;
        // return 0.875;  /// 현재 0.875 값에 해당하는 status는 존재하지 않음.
    }
  }

  // setLabelTextColorByPrescriptionStep({required PrescriptionStep step}) {
  //   Map<String, Color> colors = {
  //     '진료접수': disabledLabelTextColor,
  //     '병원진료': disabledLabelTextColor,
  //     '조제접수': disabledLabelTextColor,
  //     '약 받기': disabledLabelTextColor,
  //   };
  //
  //   switch(step) {
  //     case PrescriptionStep.onTreatment:
  //     case PrescriptionStep.issuePrescription:  /// 찰나의 state.
  //     case PrescriptionStep.depositPrescriptionFee:
  //     case PrescriptionStep.paymentErrorOnPrescriptionFee:
  //       colors['병원진료'] = enabledLabelTextColor;
  //       break;
  //
  //     case PrescriptionStep.sendMedicineFee:    /// 찰나의 state.
  //     case PrescriptionStep.sendPrescriptionPaperFromPatientToPharm:
  //     case PrescriptionStep.pharmacyPrescriptionReject:
  //     case PrescriptionStep.paymentErrorOnMedicineFee:
  //     case PrescriptionStep.depositMedicineFee:
  //       colors['조제접수'] = enabledLabelTextColor;
  //       break;
  //
  //     case PrescriptionStep.medicineTaken:
  //       colors['약 받기'] = enabledLabelTextColor;
  //       break;
  //
  //     default:
  //       /// case PrescriptionStep.applyPrescription:
  //       /// case PrescriptionStep.appointmentTreatment:
  //       /// case PrescriptionStep.hospitalPrescriptionReject:
  //       /// case PrescriptionStep.patientCancelPrescription:
  //       colors['진료접수'] = enabledLabelTextColor;
  //       break;
  //   }
  //   return colors;
  // }

  Map<String, Map<double, Color>> setColorsByStepValue({
    required String stepValueToString,
    required bool isPrescriptionIssued
  }) {
    PrescriptionStep prescriptionStep = prescriptionStepByState[stepValueToString]!;
    // double stepToDouble = double.parse(stepValueToString);
    double stepToDouble = stepValueByPrescriptionStep(step: prescriptionStep, isPrescriptionIssued: isPrescriptionIssued);

    Map<String, Map<double, Color>> colors = {
      'stepLabel': {
        0.125: disabledLabelTextColor,
        0.375: disabledLabelTextColor,
        0.625: disabledLabelTextColor,
        0.875: disabledLabelTextColor,
      },
      'mainStepCircle': {
        0.125: disabledMainStepCircleColor,
        0.375: disabledMainStepCircleColor,
        0.625: disabledMainStepCircleColor,
        0.875: disabledMainStepCircleColor,
      },
      'halfStepCircle': {
        0: disabledHalfStepCircleColor,
        0.25: disabledHalfStepCircleColor,
        0.5: disabledHalfStepCircleColor,
        0.75: disabledHalfStepCircleColor,
        1: disabledHalfStepCircleColor,
      },
    };

    colors['stepLabel']!.keys.forEach((element) {
      if(element == stepToDouble)
        colors['stepLabel']![element] = enabledLabelTextColor;
      else
        colors['stepLabel']![element] = disabledLabelTextColor;
    });
    colors['mainStepCircle']!.keys.forEach((element) {
      if(element <= stepToDouble)
        colors['mainStepCircle']![element] = enabledMainStepCircleColor;
      else
        colors['mainStepCircle']![element] = disabledMainStepCircleColor;
    });
    colors['halfStepCircle']!.keys.forEach((element) {
      if(element <= stepToDouble)
        colors['halfStepCircle']![element] = enabledHalfStepCircleColor;
      else
        colors['halfStepCircle']![element] = disabledHalfStepCircleColor;
    });

    return colors;
  }
}