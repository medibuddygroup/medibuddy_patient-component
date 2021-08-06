import 'package:flutter/material.dart';
import 'package:medihere_ui/medibuddy_ui_kit.dart';

class MHeader extends StatefulWidget {
  final Widget? leading;
  final Widget content;
  final Widget? trailing;

  MHeader({this.leading, required this.content, this.trailing});

  @override
  _MHeaderState createState() => _MHeaderState();
}

class _MHeaderState extends State<MHeader> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: MColors.gray[80]!,
              ),
            ),
          ),
          width: double.infinity,
          height: constraints.maxWidth > 360 ? 80 : 48,
          child: Row(
            children: [
              widget.leading ?? SizedBox.shrink(),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: widget.content,
                ),
              ),
              widget.trailing ?? SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
