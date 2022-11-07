import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/medibuddy_ui_kit.dart';

class PrescriptionProgressStepBarUtil {

  final Color enabledLabelTextColor = MColors.gray[900]!;
  final Color disabledLabelTextColor = MColors.gray[400]!;
  final Color enabledMainStepCircleColor = MColors.blue[400]!;
  final Color disabledMainStepCircleColor = MColors.gray[100]!;
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
      case PrescriptionStep.reissuePrescription:
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

  Map<String, dynamic> setColorsAndStepValue({
    required String stepValueToString,
    required bool isPrescriptionIssued
  }) {
    PrescriptionStep prescriptionStep = prescriptionStepByState[stepValueToString]!;
    double stepToDouble = stepValueByPrescriptionStep(step: prescriptionStep, isPrescriptionIssued: isPrescriptionIssued);
    double progressBarValue = _regulateProgressBarValue(valueToString: stepToDouble.toString());

    Map<String, dynamic> colorsAndStepValue = {
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
      'progressBarValue': progressBarValue,
    };

    for (double key in (colorsAndStepValue['stepLabel']!.keys)) {
      double statusRangeValue = stepToDouble - key;
      if((-unitValue <= statusRangeValue) && (statusRangeValue <= unitValue)) {
        colorsAndStepValue['stepLabel']![key] = enabledLabelTextColor;
        break;
      }
    }

    colorsAndStepValue['mainStepCircle']!.keys.forEach((element) {
      if(element <= stepToDouble)
        colorsAndStepValue['mainStepCircle']![element] = enabledMainStepCircleColor;
      else
        colorsAndStepValue['mainStepCircle']![element] = disabledMainStepCircleColor;
    });
    colorsAndStepValue['halfStepCircle']!.keys.forEach((element) {
      if(element <= stepToDouble)
        colorsAndStepValue['halfStepCircle']![element] = enabledHalfStepCircleColor;
      else
        colorsAndStepValue['halfStepCircle']![element] = disabledHalfStepCircleColor;
    });

    return colorsAndStepValue;
  }

  double _regulateProgressBarValue({required String valueToString}) {
    double regulatedValue = double.parse(valueToString);

    switch(valueToString) {
      case "0.375":
      case "0.625":
      case "0.875":
        // regulatedValue += 0.01;
        break;
      default:
        break;
    }
    return regulatedValue;
  }
}