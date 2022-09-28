import 'package:flutter/material.dart';

class PrescriptionCard extends StatelessWidget {

  final String hospitalName;
  final String? pharmacyName;

  const PrescriptionCard({
    Key? key,
    required this.hospitalName,
    this.pharmacyName,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
