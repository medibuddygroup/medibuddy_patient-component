import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/medibuddy_ui_kit.dart';

class MTextButton extends StatefulWidget {
  final ButtonSize size; // Button height.
  final Widget child;
  final void Function() onPressed;
  final ButtonStyle style;

  MTextButton._(
      {Key? key,
      required void Function() onPressed,
      required ButtonSize size,
      required Widget child,
      required ButtonStyle style})
      : onPressed = onPressed,
        size = size,
        child = child,
        style = style,
        super(key: key);

  factory MTextButton.blue({
    Key? key,
    required void Function() onPressed,
    required ButtonSize size,
    required Widget child,
  }) {
    return MTextButton._(
      onPressed: onPressed,
      size: size,
      child: child,
      style: ButtonUtil.sizeToTextBlueStyle(size),
    );
  }

  factory MTextButton.red(
      {Key? key,
      required void Function() onPressed,
      required ButtonSize size,
      required Widget child}) {
    return MTextButton._(
      onPressed: onPressed,
      size: size,
      child: child,
      style: ButtonUtil.sizeToTextRedStyle(size),
    );
  }

  factory MTextButton.gray(
      {Key? key,
      required void Function() onPressed,
      required ButtonSize size,
      required Widget child}) {
    return MTextButton._(
      onPressed: onPressed,
      size: size,
      child: child,
      style: ButtonUtil.sizeToTextGrayStyle(size),
    );
  }
  @override
  _MTextButtonState createState() => _MTextButtonState();
}

class _MTextButtonState extends State<MTextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: ButtonUtil.sizeToLp(widget.size),
      child: TextButton(
        onPressed: widget.onPressed,
        style: widget.style,
        child: widget.child,
      ),
    );
  }
}
