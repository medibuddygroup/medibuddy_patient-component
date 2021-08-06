import 'package:medihere_ui/constants/constants.dart';
import 'package:medihere_ui/medihere_ui.dart';

class ButtonUtil {
  static double sizeToLp(ButtonSize size) {
    switch (size) {
      case ButtonSize.xl:
        return 48;
      case ButtonSize.lg:
        return 40;
      case ButtonSize.md:
        return 32;
      case ButtonSize.sm:
        return 24;
    }
  }

  static sizeToSolidBlueStyle(ButtonSize size) {
    switch (size) {
      case ButtonSize.xl:
        return MButtonStyles.solidBlueXL;
      case ButtonSize.lg:
        return MButtonStyles.solidBlueL;
      case ButtonSize.md:
        return MButtonStyles.solidBlueM;
      case ButtonSize.sm:
        return MButtonStyles.solidBlueS;
    }
  }

  static sizeToSolidYellowStyle(ButtonSize size) {
    switch (size) {
      case ButtonSize.xl:
        return MButtonStyles.solidYellowXL;
      case ButtonSize.lg:
        return MButtonStyles.solidYellowL;
      case ButtonSize.md:
        return MButtonStyles.solidYellowM;
      case ButtonSize.sm:
        return MButtonStyles.solidYellowS;
    }
  }

  static sizeToSolidKakaoStyle(ButtonSize size) {
    switch (size) {
      case ButtonSize.xl:
        return MButtonStyles.solidKakaoXL;
      case ButtonSize.lg:
        return MButtonStyles.solidKakaoL;
      case ButtonSize.md:
        return MButtonStyles.solidKakaoM;
      case ButtonSize.sm:
        return MButtonStyles.solidKakaoS;
    }
  }

  static sizeToOutlinedBlueStyle(ButtonSize size) {
    switch (size) {
      case ButtonSize.xl:
        return MButtonStyles.outlinedBlueXL;
      case ButtonSize.lg:
        return MButtonStyles.outlinedBlueL;
      case ButtonSize.md:
        return MButtonStyles.outlinedBlueM;
      case ButtonSize.sm:
        return MButtonStyles.outlinedBlueS;
    }
  }

  static sizeToOutlinedGrayStyle(ButtonSize size) {
    switch (size) {
      case ButtonSize.xl:
        return MButtonStyles.outlinedGrayXL;
      case ButtonSize.lg:
        return MButtonStyles.outlinedGrayL;
      case ButtonSize.md:
        return MButtonStyles.outlinedGrayM;
      case ButtonSize.sm:
        return MButtonStyles.outlinedGrayS;
    }
  }

  static sizeToTextBlueStyle(ButtonSize size) {
    switch (size) {
      case ButtonSize.xl:
        return MButtonStyles.textBlueXL;
      case ButtonSize.lg:
        return MButtonStyles.textBlueL;
      case ButtonSize.md:
        return MButtonStyles.textBlueM;
      case ButtonSize.sm:
        return MButtonStyles.textBlueS;
    }
  }

  static sizeToTextGrayStyle(ButtonSize size) {
    switch (size) {
      case ButtonSize.xl:
        return MButtonStyles.textGrayXL;
      case ButtonSize.lg:
        return MButtonStyles.textGrayL;
      case ButtonSize.md:
        return MButtonStyles.textGrayM;
      case ButtonSize.sm:
        return MButtonStyles.textGrayS;
    }
  }

  static sizeToTextRedStyle(ButtonSize size) {
    switch (size) {
      case ButtonSize.xl:
        return MButtonStyles.textRedXL;
      case ButtonSize.lg:
        return MButtonStyles.textRedL;
      case ButtonSize.md:
        return MButtonStyles.textRedM;
      case ButtonSize.sm:
        return MButtonStyles.textRedS;
    }
  }
}
