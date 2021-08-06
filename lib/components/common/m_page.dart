import 'package:flutter/material.dart';

class MPage extends StatelessWidget {
  final Widget appBar;
  final Widget body;

  const MPage({Key? key, required this.appBar, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBar,
        Expanded(child: body),
      ],
    );
  }
}
