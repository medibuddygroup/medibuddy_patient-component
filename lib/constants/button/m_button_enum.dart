enum ButtonSize {
  /// height: 56
  xl,
  /// height: 48 (default)
  l,
  /// height: 40
  m,
  /// height: 32
  s,
  /// height: 24
  xs
}
enum ButtonColor { blue, gray, red }
enum ButtonType { solid, outlined, text, singleDialogButton, leftDialogButton, rightDialogButton }

const Map<ButtonSize, double> buttonHeightFromSize = {
  ButtonSize.xl : 56,
  ButtonSize.l : 48,
  ButtonSize.m : 40,
  ButtonSize.s : 32,
  ButtonSize.xs : 24,
};