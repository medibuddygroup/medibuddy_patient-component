import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/constants/button/m_button_enum.dart';
import 'package:medibuddy_ui_kit/constants/m_colors.dart';
import 'package:medibuddy_ui_kit/constants/text/m_text_styles.dart';

class ButtonUtil {

  Decoration? buttonDecorationByTypeAndColor(ButtonType type, ButtonColor color, {required bool isDisabled}) {
    switch(type) {
      case ButtonType.outlined:
        return BoxDecoration(
          border: Border.all(color: _buttonBorderColorByColor(color, isDisabled)),
          borderRadius: BorderRadius.circular(8),
        );
      case ButtonType.singleDialogButton:
        return BoxDecoration(
          border: Border(top: BorderSide(color: MColors.gray[80]!)),
        );
      case ButtonType.leftDialogButton:
        return BoxDecoration(
          border: Border(
            top: BorderSide(color: MColors.gray[80]!),
            right: BorderSide(color: MColors.gray[80]!),
          ),
        );
      case ButtonType.rightDialogButton:
        return BoxDecoration(
          border: Border(top: BorderSide(color: MColors.gray[80]!)),
        );
      case ButtonType.solid:
      case ButtonType.text:
      default:
        return null;
    }
  }

  TextStyle? buttonTextStyleByButtonProperties(ButtonType type, ButtonSize size, ButtonColor color, {required bool isDisabled}) {
    switch(size) {
      case ButtonSize.xl:
        return type == ButtonType.solid
            ? MTextStyles.black[21]!.copyWith(color: Colors.white)
            : (type == ButtonType.outlined || type == ButtonType.text)
            ? MTextStyles.bold[21]!.copyWith(color: _buttonTextColorByTypeAndColor(type, color, isDisabled))
            : MTextStyles.bold[18]!.copyWith(color: _buttonTextColorByTypeAndColor(type, color, isDisabled));
      case ButtonSize.l:
        return type == ButtonType.solid
            ? MTextStyles.black[18]!.copyWith(color: Colors.white)
            : (type == ButtonType.outlined || type == ButtonType.text)
            ? MTextStyles.bold[18]!.copyWith(color: _buttonTextColorByTypeAndColor(type, color, isDisabled))
            : MTextStyles.bold[16]!.copyWith(color: _buttonTextColorByTypeAndColor(type, color, isDisabled));
      case ButtonSize.m:
        return type == ButtonType.solid
            ? MTextStyles.black[16]!.copyWith(color: Colors.white)
            : (type == ButtonType.outlined || type == ButtonType.text)
            ? MTextStyles.bold[16]!.copyWith(color: _buttonTextColorByTypeAndColor(type, color, isDisabled))
            : MTextStyles.bold[14]!.copyWith(color: _buttonTextColorByTypeAndColor(type, color, isDisabled));
      case ButtonSize.s:
        return type == ButtonType.solid
            ? MTextStyles.black[14]!.copyWith(color: Colors.white)
            : (type == ButtonType.outlined || type == ButtonType.text)
            ? MTextStyles.bold[14]!.copyWith(color: _buttonTextColorByTypeAndColor(type, color, isDisabled))
            : MTextStyles.bold[12]!.copyWith(color: _buttonTextColorByTypeAndColor(type, color, isDisabled));
      case ButtonSize.xs:
        return type == ButtonType.solid
            ? MTextStyles.black[12]!.copyWith(color: Colors.white)
            : (type == ButtonType.outlined || type == ButtonType.text)
            ? MTextStyles.bold[12]!.copyWith(color: _buttonTextColorByTypeAndColor(type, color, isDisabled))
            : MTextStyles.bold[12]!.copyWith(color: _buttonTextColorByTypeAndColor(type, color, isDisabled), fontSize: 10);
    }
  }

  ButtonStyle buttonStyleBySizeAndColor(ButtonType type, ButtonSize size, ButtonColor color) {
    return ButtonStyle(
      padding: MaterialStateProperty.all(_buttonPaddingBySize(size)),
      backgroundColor: MaterialStateProperty .resolveWith((states) => _buttonBackgroundColorByTypeAndColor(states, type, color)),
      overlayColor: MaterialStateProperty.all(_buttonSelectedColorByTypeAndColor(type, color)),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: _buttonBorderRadiusByType(type))
      ),
      /// 아래는 추후 쓰일 수 있음.
      // elevation: MaterialStateProperty.resolveWith((states) => 6),
      // shadowColor: MaterialStateProperty.resolveWith((states) => MColors.blue[800]!),
    );
  }

  EdgeInsets _buttonPaddingBySize(ButtonSize size) {
    switch(size) {
      case ButtonSize.xl:
      case ButtonSize.l:
      case ButtonSize.m:
        return EdgeInsets.symmetric(horizontal: 16);
      case ButtonSize.s:
        return EdgeInsets.symmetric(horizontal: 12);
      case ButtonSize.xs:
        return EdgeInsets.symmetric(horizontal: 8);
    }
  }

  Color? _buttonBackgroundColorByTypeAndColor(Set<MaterialState> states, ButtonType type, ButtonColor color) {
    if(states.contains(MaterialState.disabled)) {
      switch(type) {
        case ButtonType.outlined:
          return Colors.white;
        case ButtonType.text:
          return Colors.transparent;
        case ButtonType.solid:
        case ButtonType.singleDialogButton:
        case ButtonType.leftDialogButton:
        case ButtonType.rightDialogButton:
        default:
          return MColors.gray[80]!;
      }
    }
    else {
      switch(type) {
        case ButtonType.outlined:
        case ButtonType.singleDialogButton:
        case ButtonType.leftDialogButton:
        case ButtonType.rightDialogButton:
          return Colors.white;
        case ButtonType.text:
          return Colors.transparent;
        case ButtonType.solid:
        default:
          return color == ButtonColor.blue
              ? MColors.blue[400]!
              : color == ButtonColor.red
              ? MColors.red[400]!
              : Colors.white;
      }
    }
  }

  Color? _buttonSelectedColorByTypeAndColor(ButtonType type, ButtonColor color) {
    switch(type) {
      case ButtonType.outlined:
        return color == ButtonColor.blue
            ? MColors.blue[50]!
            : color == ButtonColor.gray
            ? MColors.gray[40]!
            : MColors.red[50]!;
      case ButtonType.solid:
        return color == ButtonColor.blue
            ? MColors.blue[600]!
            : color == ButtonColor.red
            ? MColors.red[600]!
            : null;
      case ButtonType.singleDialogButton:
      case ButtonType.leftDialogButton:
      case ButtonType.rightDialogButton:
        return MColors.gray[40]!;
      case ButtonType.text:
      default:
        return Colors.transparent;
    }
  }

  BorderRadiusGeometry _buttonBorderRadiusByType(ButtonType type) {
    switch(type) {
      case ButtonType.singleDialogButton:
        return BorderRadius.only(
          bottomRight: Radius.circular(8),
          bottomLeft: Radius.circular(8)
        );
      case ButtonType.leftDialogButton:
        return BorderRadius.only(bottomLeft: Radius.circular(8));
      case ButtonType.rightDialogButton:
        return BorderRadius.only(bottomRight: Radius.circular(8));
      case ButtonType.solid:
      case ButtonType.outlined:
      case ButtonType.text:
      default:
        return BorderRadius.circular(8);
    }
  }

  Color? _buttonTextColorByTypeAndColor(ButtonType type, ButtonColor color, bool isDisabled) {
    switch(type) {
      case ButtonType.outlined:
      case ButtonType.text:
      case ButtonType.singleDialogButton:
      case ButtonType.leftDialogButton:
      case ButtonType.rightDialogButton:
        if(isDisabled) return MColors.gray[80]!;
        else
          return color == ButtonColor.blue
              ? MColors.blue[800]!
              : color == ButtonColor.red
              ? MColors.red[600]!
              : MColors.gray[600]!;
      case ButtonType.solid:
        return Colors.white;
      default:
        return MColors.gray[900]!;
    }
  }

  Color _buttonBorderColorByColor(ButtonColor color, bool isDisabled) {
    if(isDisabled) return MColors.gray[80]!;
    else
      switch(color) {
        case ButtonColor.blue:
          return MColors.blue[800]!;
        case ButtonColor.red:
          return MColors.red[600]!;
        case ButtonColor.gray:
          return MColors.gray[600]!;
      }
  }
}
