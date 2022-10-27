import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/constants/button/m_button_enum.dart';
import 'package:medibuddy_ui_kit/util/button_util.dart';

class MButton extends StatelessWidget with ButtonUtil {

  final String text;
  /// buttonSize means buttonHeight
  final ButtonSize size;
  final ButtonColor buttonColor;
  final ButtonType type;
  final double? width;
  final EdgeInsets? margin;
  final Function()? onPressed;

  const MButton._({
    Key? key,
    required this.text,
    required this.size,
    required this.buttonColor,
    required this.type,
    this.width,
    this.margin,
    this.onPressed,
  }) : super(key: key);


  factory MButton.solid({
    Key? key,
    required String text,
    required ButtonSize size,
    required ButtonColor buttonColor,
    double? width,
    EdgeInsets? margin,
    Function()? onPressed,
  }) {
    return MButton._(
      text: text,
      size: size,
      buttonColor: buttonColor,
      type: ButtonType.solid,
      width: width,
      margin: margin,
      onPressed: onPressed,
    );
  }

  factory MButton.outlined({
    Key? key,
    required String text,
    required ButtonSize size,
    required ButtonColor buttonColor,
    double? width,
    EdgeInsets? margin,
    Function()? onPressed,
  }) {
    return MButton._(
      text: text,
      size: size,
      buttonColor: buttonColor,
      type: ButtonType.outlined,
      width: width,
      margin: margin,
      onPressed: onPressed,
    );
  }

  factory MButton.text({
    Key? key,
    required String text,
    required ButtonSize size,
    required ButtonColor buttonColor,
    double? width,
    EdgeInsets? margin,
    Function()? onPressed,
  }) {
    return MButton._(
      text: text,
      size: size,
      buttonColor: buttonColor,
      type: ButtonType.text,
      width: width,
      margin: margin,
      onPressed: onPressed,
    );
  }

  factory MButton.singleDialogButton({
    Key? key,
    required String text,
    required ButtonSize size,
    required ButtonColor buttonColor,
    double? width,
    EdgeInsets? margin,
    Function()? onPressed,
  }) {
    return MButton._(
      text: text,
      size: size,
      buttonColor: buttonColor,
      type: ButtonType.singleDialogButton,
      width: width,
      margin: margin,
      onPressed: onPressed,
    );
  }

  factory MButton.leftDialogButton({
    Key? key,
    required String text,
    required ButtonSize size,
    required ButtonColor buttonColor,
    double? width,
    EdgeInsets? margin,
    Function()? onPressed,
  }) {
    return MButton._(
      text: text,
      size: size,
      buttonColor: buttonColor,
      type: ButtonType.leftDialogButton,
      width: width,
      margin: margin,
      onPressed: onPressed,
    );
  }

  factory MButton.rightDialogButton({
    Key? key,
    required String text,
    required ButtonSize size,
    required ButtonColor buttonColor,
    double? width,
    EdgeInsets? margin,
    Function()? onPressed,
  }) {
    return MButton._(
      text: text,
      size: size,
      buttonColor: buttonColor,
      type: ButtonType.rightDialogButton,
      width: width,
      margin: margin,
      onPressed: onPressed,
    );
  }

  factory MButton({
    Key? key,
    required String text,
    required ButtonSize size,
    required ButtonColor buttonColor,
    double? width,
    EdgeInsets? margin,
    Function()? onPressed,
  }) {
    return MButton._(
      text: text,
      size: size,
      buttonColor: buttonColor,
      type: ButtonType.solid,
      width: width,
      margin: margin,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: buttonHeightFromSize[size],
      margin: margin,
      decoration: buttonDecorationByTypeAndColor(type, size, buttonColor, isDisabled: onPressed == null ? true : false),
      child: TextButton(
        style: buttonStyleBySizeAndColor(type, size, buttonColor),
        onPressed: onPressed,
        child: Text(
          text,
          style: buttonTextStyleByButtonProperties(type, size, buttonColor, isDisabled: onPressed == null ? true : false),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
