import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/medibuddy_ui_kit.dart';

class MTextFieldBorderHorizontal extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String placeholder;
  final TextFieldDirection direction;
  final FocusNode? focusNode;
  final TextInputType? keyboardInputType;

  MTextFieldBorderHorizontal._(
      {Key? key,
      required this.controller,
      required this.label,
      required this.placeholder,
      required this.direction,
      this.focusNode,
      this.keyboardInputType})
      : super(key: key);

  factory MTextFieldBorderHorizontal.vertical({
    Key? key,
    required TextEditingController controller,
    required String label,
    required String placeholder,
    FocusNode? focusNode,
    TextInputType? keyboardInputType,
  }) {
    return MTextFieldBorderHorizontal._(
      key: key,
      controller: controller,
      label: label,
      placeholder: placeholder,
      direction: TextFieldDirection.vertical,
      focusNode: focusNode,
      keyboardInputType: keyboardInputType,
    );
  }

  factory MTextFieldBorderHorizontal.horizontal({
    Key? key,
    required TextEditingController controller,
    required String label,
    required String placeholder,
    FocusNode? focusNode,
    TextInputType? keyboardInputType,
  }) {
    return MTextFieldBorderHorizontal._(
      key: key,
      controller: controller,
      label: label,
      placeholder: placeholder,
      direction: TextFieldDirection.horizontal,
      focusNode: focusNode,
      keyboardInputType: keyboardInputType,
    );
  }

  @override
  _MTextFieldBorderHorizontalState createState() =>
      _MTextFieldBorderHorizontalState();
}

class _MTextFieldBorderHorizontalState
    extends State<MTextFieldBorderHorizontal> {
  @override
  Widget build(BuildContext context) {
    if (widget.direction == TextFieldDirection.horizontal) {
      return InkWell(
        onTap: widget.focusNode!.hasFocus
            ? null
            : () => widget.focusNode!.requestFocus(),
        focusColor: Colors.white,
        hoverColor: Colors.white,
        highlightColor: Colors.white,
        splashColor: Colors.black.withAlpha(25),
        child: AbsorbPointer(
          absorbing: widget.focusNode!.hasFocus,
          child: TextField(
            keyboardType: widget.keyboardInputType,
            focusNode: widget.focusNode,
            style: MTextStyles.bold[21]!.copyWith(color: MTextColors.primary),
            decoration: InputDecoration(
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.label,
                    style: MTextStyles.bold[14]!.copyWith(
                      color: MColors.gray[600],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              contentPadding:
                  EdgeInsets.only(top: 4, bottom: 7, left: 4, right: 4),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: MColors.red[700]!),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: MColors.gray[200]!,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: MColors.blue[500]!,
                ),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: MColors.red[700]!,
                ),
              ),
              hintStyle: MTextStyles.bold[21]!.copyWith(
                color: MColors.gray[100],
              ),
              hintText: widget.placeholder,
            ),
            controller: widget.controller,
          ),
        ),
      );
    } else {
      // TODO: 수평형 텍스트필드 구현
      return SizedBox.shrink();
    }
  }
}
