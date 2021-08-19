import 'package:flutter/material.dart';

class MStatusIcon extends StatefulWidget {
  final Widget child;
  final void Function()? onTap;

  MStatusIcon({Key? key, required this.child, this.onTap}) : super(key: key);

  @override
  _MStatusIconState createState() => _MStatusIconState();
}

class _MStatusIconState extends State<MStatusIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, bottom: 12),
      child: SizedBox(
        width: 24,
        height: 24,
        child: widget.child,
      ),
    );
  }
}
