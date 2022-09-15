enum IconType {
  /// icon size 16
  bold,
  /// icon size 24 (default)
  regular,
  /// icon size 32
  light
}

const Map<IconType, double> iconSizeFromType = {
  IconType.bold: 16,
  IconType.regular : 24,
  IconType.light : 32,
};