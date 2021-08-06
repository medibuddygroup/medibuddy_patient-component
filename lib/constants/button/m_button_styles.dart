import 'package:flutter/material.dart';
import 'package:medihere_ui/medibuddy_ui_kit.dart';

class MButtonStyles {
  /// 버튼의 Color만 지정함, TextStyle까지 지정된 public 변수들을 사용하도록 하자.
  /// public 변수 [solidBlueXL, ...]
  static final ButtonStyle _solidBlue = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.white),
    backgroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return MColors.gray[80];
        } else {
          return MColors.blue[500];
        }
      },
    ),
    overlayColor: MaterialStateProperty.all(MColors.blue[700]),
  );
  static final solidBlueXL = _solidBlue.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.black[21]),
  );
  static final solidBlueL = _solidBlue.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.black[18]),
  );
  static final solidBlueM = _solidBlue.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.black[16]),
  );
  static final solidBlueS = _solidBlue.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.black[14]),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final ButtonStyle _solidYellow = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.white),
    backgroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return MColors.gray[80];
        } else {
          return MColors.yellow[500];
        }
      },
    ),
    overlayColor: MaterialStateProperty.all(MColors.yellow[700]),
  );
  static final solidYellowXL = _solidYellow.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.black[21]),
  );
  static final solidYellowL = _solidYellow.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.black[18]),
  );
  static final solidYellowM = _solidYellow.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.black[16]),
  );
  static final solidYellowS = _solidYellow.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.black[14]),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final ButtonStyle _solidKakao = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.white),
    backgroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return MColors.gray[80];
        } else {
          return const Color(0xFFFEE500); //MColors.yellow[10];
        }
      },
    ),
    overlayColor: MaterialStateProperty.all(MColors.yellow[500]),
  );
  static final solidKakaoXL = _solidKakao.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.black[21]),
  );
  static final solidKakaoL = _solidKakao.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.black[18]),
  );
  static final solidKakaoM = _solidKakao.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.black[16]),
  );
  static final solidKakaoS = _solidKakao.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.black[14]),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final ButtonStyle _outlinedBlue = ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 16),
    ),
    side: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return BorderSide(color: MColors.gray[80]!);
      } else {
        return BorderSide(color: MColors.blue[800]!);
      }
    }),
    foregroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return MColors.gray[80];
        } else {
          return MColors.blue[800];
        }
      },
    ),
    backgroundColor: MaterialStateProperty.all(Colors.white),
    overlayColor: MaterialStateProperty.all(MColors.blue[100]),
  );
  static final outlinedBlueXL = _outlinedBlue.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[21]),
  );
  static final outlinedBlueL = _outlinedBlue.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[18]),
  );
  static final outlinedBlueM = _outlinedBlue.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[16]),
  );
  static final outlinedBlueS = _outlinedBlue.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[14]),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final ButtonStyle _outlinedGray = ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 16),
    ),
    side: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return BorderSide(color: MColors.gray[80]!);
      } else {
        return BorderSide(color: MColors.gray[600]!);
      }
    }),
    foregroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return MColors.gray[80];
        } else {
          return MColors.gray[600];
        }
      },
    ),
    backgroundColor: MaterialStateProperty.all(Colors.white),
    overlayColor: MaterialStateProperty.all(MColors.gray[80]),
  );
  static final outlinedGrayXL = _outlinedGray.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[21]),
  );
  static final outlinedGrayL = _outlinedGray.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[18]),
  );
  static final outlinedGrayM = _outlinedGray.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[16]),
  );
  static final outlinedGrayS = _outlinedGray.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[14]),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final ButtonStyle _textBlue = ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 16),
    ),
    foregroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return MColors.gray[80];
        } else {
          return MColors.blue[800];
        }
      },
    ),
    backgroundColor: MaterialStateProperty.all(Colors.white),
    overlayColor: MaterialStateProperty.all(MColors.blue[100]),
  );
  static final textBlueXL = _textBlue.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[21]),
  );
  static final textBlueL = _textBlue.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[18]),
  );
  static final textBlueM = _textBlue.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[16]),
  );
  static final textBlueS = _textBlue.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[14]),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final ButtonStyle _textGray = ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 16),
    ),
    foregroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return MColors.gray[80];
        } else {
          return MColors.gray[600];
        }
      },
    ),
    backgroundColor: MaterialStateProperty.all(Colors.white),
    overlayColor: MaterialStateProperty.all(MColors.gray[80]),
  );
  static final textGrayXL = _textGray.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[21]),
  );
  static final textGrayL = _textGray.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[18]),
  );
  static final textGrayM = _textGray.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[16]),
  );
  static final textGrayS = _textGray.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[14]),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final ButtonStyle _textRed = ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 16),
    ),
    foregroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return MColors.gray[80];
        } else {
          return MColors.red[700];
        }
      },
    ),
    backgroundColor: MaterialStateProperty.all(Colors.white),
    overlayColor: MaterialStateProperty.all(MColors.red[100]),
  );
  static final textRedXL = _textRed.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[21]),
  );
  static final textRedL = _textRed.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[18]),
  );
  static final textRedM = _textRed.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[16]),
  );
  static final textRedS = _textRed.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    ),
    textStyle: MaterialStateProperty.all(MTextStyles.bold[14]),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
