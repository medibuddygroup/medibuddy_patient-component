import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/components/common/widgets/atoms/button/m_button.dart';
import 'package:medibuddy_ui_kit/constants/constants.dart';

class MDialog extends StatefulWidget {
  final Widget? contents;
  final double? dialogRadius;

  const MDialog._({
    Key? key,
    this.contents,
    this.dialogRadius = 8,
  }) : super(key: key);

  factory MDialog.loading({Key? key}) {
    return MDialog._(
      contents: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 32),
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
          )
        ]
      ),
    );
  }

  factory MDialog.alert({
    Key? key,
    required String contentText,
    required TextStyle contentTextStyle,
    required String buttonText,
    required ButtonSize buttonSize,
    required ButtonColor buttonColor,
    double? dialogRadius,
    Function()? onPressButton,
  }) {
    return MDialog._(
      dialogRadius: dialogRadius,
      contents: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 24),
            child: Center(
              child: Text(
                contentText,
                style: contentTextStyle,
                textAlign: TextAlign.center,
              ),
            )
          ),
          MButton.singleDialogButton(
            text: buttonText,
            size: buttonSize,
            buttonColor: buttonColor,
            onPressed: onPressButton,
          ),
        ]
      )
    );
  }

  factory MDialog.feedBack({
    Key? key,
    required Widget contents,
    required String leftButtonText,
    required String rightButtonText,
    required ButtonSize buttonSize,
    required ButtonColor leftButtonColor,
    required ButtonColor rightButtonColor,
    required Function() onPressLeftButton,
    required Function() onPressRightButton,
    double? dialogBorderRadius,
    EdgeInsets? contentsPadding,
  }) {
    return MDialog._(
      dialogRadius: dialogBorderRadius,
      contents: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: contentsPadding ?? const EdgeInsets.all(16),
            child: contents,
          ),
          Row(
            children: [
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: MButton.leftDialogButton(
                  text: leftButtonText,
                  size: buttonSize,
                  buttonColor: leftButtonColor,
                  onPressed: onPressLeftButton,
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: MButton.rightDialogButton(
                  text: rightButtonText,
                  size: buttonSize,
                  buttonColor: rightButtonColor,
                  onPressed: onPressRightButton,
                ),
              ),
            ],
          )
        ],
      )
    );
  }

  factory MDialog({
    Key? key,
    Widget? contents,
    double? dialogRadius,
  }) {
    return MDialog._(
      dialogRadius: dialogRadius,
      contents: contents,
    );
  }

  @override
  _MDialogState createState() => _MDialogState();
}

class _MDialogState extends State<MDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.dialogRadius!)),
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 32), /// 다이얼로그 바깥 마진
          child: SingleChildScrollView(
            child: widget.contents?? SizedBox.shrink(),
          ),
        )
      ],
    );
  }
}
