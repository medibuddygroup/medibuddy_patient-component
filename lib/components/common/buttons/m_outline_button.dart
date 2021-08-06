import 'package:flutter/material.dart';
import 'package:medihere_ui/medihere_ui.dart';

class MOutlinedButton extends StatefulWidget {
  final ButtonSize size; // Button height.
  final Widget child;
  final void Function() onPressed;
  final ButtonStyle style;

  const MOutlinedButton._({
    Key? key,
    required this.size,
    required this.child,
    required this.style,
    required this.onPressed,
  }) : super(key: key);

  factory MOutlinedButton.blue(
      {Key? key,
      required ButtonSize size,
      required Widget child,
      required void Function() onPressed}) {
    return MOutlinedButton._(
      size: size,
      child: child,
      style: ButtonUtil.sizeToOutlinedBlueStyle(size),
      onPressed: onPressed,
    );
  }
  factory MOutlinedButton.gray(
      {Key? key,
      required ButtonSize size,
      required Widget child,
      ButtonStyle buttonStyle = const ButtonStyle(),
      required void Function() onPressed}) {
    return MOutlinedButton._(
      size: size,
      child: child,
      style: buttonStyle == ButtonStyle()
          ? ButtonUtil.sizeToOutlinedGrayStyle(size)
          : buttonStyle,
      onPressed: onPressed,
    );
  }

  @override
  _MOutlinedButtonState createState() => _MOutlinedButtonState();
}

class _MOutlinedButtonState extends State<MOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ButtonUtil.sizeToLp(widget.size),
      child: OutlinedButton(
        style: widget.style,
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }
}
