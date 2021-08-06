import 'package:flutter/material.dart';

class MColors {
  static const gray = MaterialColor(
    0xFF969BA0,
    {
      40: const Color(0xFFF0F5FA),
      60: const Color(0xFFEBF0F5),
      80: const Color(0xFFE6EBF0),
      100: const Color(0xFFCAD1D7),
      200: const Color(0xFFBBC5CC),
      300: const Color(0xFFACB8C1),
      400: const Color(0xFF939EA7),
      500: const Color(0xFF7B858C),
      600: const Color(0xFF626B72),
      700: const Color(0xFF495158),
      800: const Color(0xFF31383D),
      900: const Color(0xFF181E23),
    },
  );

  static const blue = MaterialColor(0xFF29B6F6, {
    50: const Color(0xFFE1F5FE),
    100: const Color(0xFFB3E5FC),
    200: const Color(0xFF81D4FA),
    300: const Color(0xFF4FC3F7),
    400: const Color(0xFF29B6F6),
    500: const Color(0xFF03A9F4),
    600: const Color(0xFF039BE5),
    700: const Color(0xFF0288D1),
    800: const Color(0xFF0277BD),
    900: const Color(0xFF01579B),
  });

  static const yellow = MaterialColor(0xFFFFCA28, {
    50: const Color(0xFFFFF8E1),
    100: const Color(0xFFFFECB3),
    200: const Color(0xFFFFE082),
    300: const Color(0xFFFFD54F),
    400: const Color(0xFFFFCA28),
    500: const Color(0xFFFFC107),
    600: const Color(0xFFFFB300),
    700: const Color(0xFFFFA000),
    800: const Color(0xFFFF8F00),
    900: const Color(0xFFFF6F00),
  });

  static const red = MaterialColor(0xFFFF7043, {
    50: const Color(0xFFFBE9E7),
    100: const Color(0xFFFFCCBC),
    200: const Color(0xFFFFAB91),
    300: const Color(0xFFFF8A65),
    400: const Color(0xFFFF7043),
    500: const Color(0xFFFF5722),
    600: const Color(0xFFF4511E),
    700: const Color(0xFFE64A19),
    800: const Color(0xFFD84315),
    900: const Color(0xFFBF360C),
  });

  static const green = MaterialColor(0xFF26A69A, {
    50: const Color(0xFFE0F2F1),
    100: const Color(0xFFB2DFDB),
    200: const Color(0xFF80CBC4),
    300: const Color(0xFF4DB6AC),
    400: const Color(0xFF26A69A),
    500: const Color(0xFF009688),
    600: const Color(0xFF00897B),
    700: const Color(0xFF00796B),
    800: const Color(0xFF00695C),
    900: const Color(0xFF004D40),
  });

  static final controlBorder = MColors.gray[200];
  static final itemBorder = MColors.gray[80];
  static final bgColor = MColors.gray[40];
}
