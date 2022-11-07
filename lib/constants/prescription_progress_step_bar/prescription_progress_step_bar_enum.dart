enum PrescriptionStep {
  applyPrescription,
  appointmentTreatment,
  hospitalPrescriptionReject,
  patientCancelPrescription,
  onTreatment,
  issuePrescription,
  depositPrescriptionFee,
  paymentErrorOnPrescriptionFee,
  sendPrescriptionPaperFromPatientToPharm,
  reissuePrescription,
  pharmacyPrescriptionReject,
  sendMedicineFee,
  paymentErrorOnMedicineFee,
  depositMedicineFee,
  medicineTaken,
}

const Map<String, PrescriptionStep> prescriptionStepByState = {
  'apply prescription' : PrescriptionStep.applyPrescription,
  'appointment treatment' : PrescriptionStep.appointmentTreatment,
  'hospital prescription reject' : PrescriptionStep.hospitalPrescriptionReject,
  'patient cancel prescription' : PrescriptionStep.patientCancelPrescription,
  'on treatment' : PrescriptionStep.onTreatment,
  'issue prescription' : PrescriptionStep.issuePrescription,
  'deposit prescription fee' : PrescriptionStep.depositPrescriptionFee,
  'payment error on prescription fee' : PrescriptionStep.paymentErrorOnPrescriptionFee,
  'send prescription paper from patient to pharm' : PrescriptionStep.sendPrescriptionPaperFromPatientToPharm,
  'reissue prescription' : PrescriptionStep.reissuePrescription,
  'pharmacy prescription reject' : PrescriptionStep.pharmacyPrescriptionReject,
  'send medicine fee' : PrescriptionStep.sendMedicineFee,
  'payment error on medicine fee' : PrescriptionStep.paymentErrorOnMedicineFee,
  'deposit medicine fee' : PrescriptionStep.depositMedicineFee,
  'medicine taken' : PrescriptionStep.medicineTaken,
};

const Map<String, double> prescriptionLabelPosition = {
  '진료접수': 0.125,
  '병원진료': 0.375,
  '조제접수': 0.625,
  '약 받기': 0.875,
};

const double unitValue = 0.125;

// const Map<PrescriptionStep, double> prescriptionStepToDouble = {
//   PrescriptionStep.applyPrescription : 0.125,
//   PrescriptionStep.appointmentTreatment : 0.25,
//   PrescriptionStep.hospitalPrescriptionReject : 0.25,
//   PrescriptionStep.patientCancelPrescription : 0.25,
//   PrescriptionStep.onTreatment : 0.375,
//   PrescriptionStep.issuePrescription : 0.5,
//   PrescriptionStep.depositPrescriptionFee : 0.5,
//   PrescriptionStep.paymentErrorOnPrescriptionFee : 0,
//   PrescriptionStep.sendPrescriptionPaperFromPatientToPharm : 0,
//   PrescriptionStep.pharmacyPrescriptionReject : 0,
//   PrescriptionStep.sendMedicineFee : 0,
//   PrescriptionStep.paymentErrorOnMedicineFee : 0,
//   PrescriptionStep.depositMedicineFee : 0,
//   PrescriptionStep.medicineTaken : 0,
// };