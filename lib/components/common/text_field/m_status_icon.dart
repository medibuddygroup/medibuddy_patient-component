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
    return Container(
      width: 32,
      height: 46,
      child: SizedBox(
        width: 20,
        height: 20,
        child: widget.child,
      ),
    );
  }
}
