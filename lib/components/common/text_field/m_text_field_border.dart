import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/medibuddy_ui_kit.dart';

class MTextFieldBorder extends StatefulWidget {
  // final TextEditingController controller;
  // final String label;
  // final String placeholder;
  // final FocusNode focusNode;
  final TextFieldDirection direction;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final String placeholder;
  final TextFieldStatus? status;
  final String? error;
  final String btnName;
  final bool? obscure;
  final bool enabled;
  final void Function()? onEditingCompleted;
  final void Function(String)? onChanged;
  final void Function()? onSubmitted;

  MTextFieldBorder._(
      {Key? key,
      required this.focusNode,
      this.onEditingCompleted,
      this.onSubmitted,
      this.onChanged,
      required this.label,
      required this.placeholder,
      this.status = TextFieldStatus.normal,
      this.enabled = true,
      this.error,
      required this.controller,
      this.obscure,
      this.btnName = '',
      required this.direction})
      : super(key: key);

  factory MTextFieldBorder.vertical({
    Key? key,
    required TextEditingController controller,
    required String label,
    required String placeholder,
    required FocusNode focusNode,
    TextFieldStatus? status = TextFieldStatus.normal,
    Function()? onEditingCompleted,
    Function(String)? onChanged,
    Function()? onSubmitted,
    bool? obscure,
    bool enabled = true,
    String? error,
    String btnName = '',
  }) {
    return MTextFieldBorder._(
      key: key,
      controller: controller,
      label: label,
      placeholder: placeholder,
      direction: TextFieldDirection.vertical,
      focusNode: focusNode,
      status: status,
      onEditingCompleted: onEditingCompleted,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      obscure: obscure,
      enabled: enabled,
      error: error,
      btnName: btnName,
    );
  }

  factory MTextFieldBorder.horizontal({
    Key? key,
    required TextEditingController controller,
    required String label,
    required String placeholder,
    required FocusNode focusNode,
  }) {
    return MTextFieldBorder._(
      key: key,
      controller: controller,
      label: label,
      placeholder: placeholder,
      direction: TextFieldDirection.horizontal,
      focusNode: focusNode,
    );
  }

  @override
  _MTextFieldBorderState createState() => _MTextFieldBorderState();
}

class _MTextFieldBorderState extends State<MTextFieldBorder> {
  Color? _borderColor;
  BoxShadow? _boxShadow;

  bool? _showClearButton;
  bool? _enableInkWell;
  bool? _obscured;

  _onHighlightChanged(highlight) {
    if (_notError()) {
      if (highlight) {
        setState(() {
          _borderColor = MColors.blue[700];
        });
      } else {
        if (widget.focusNode.hasFocus) {
          setState(() {
            _borderColor = MColors.blue[500];
          });
        } else {
          setState(() {
            _borderColor = MColors.controlBorder;
          });
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _obscured = widget.obscure ?? false;
    if (widget.status != TextFieldStatus.error) {
      _borderColor = MColors.controlBorder;
    } else {
      _borderColor = MColors.red[700];
    }

    _showClearButton = false;
    _enableInkWell = true;
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        setState(() {
          _enableInkWell = false;
          _boxShadow = BoxShadow(
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(0, 2),
            color: MColors.gray[900]!.withOpacity(0.1),
          );
          if (widget.status != TextFieldStatus.error)
            _borderColor = MColors.blue[500];
          _showClearButton = true;
        });
      } else {
        setState(() {
          _enableInkWell = true;
          _boxShadow = null;
          if (widget.status != TextFieldStatus.error)
            _borderColor = MColors.controlBorder;
          _showClearButton = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.direction == TextFieldDirection.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: MTextStyles.bold[14]!.copyWith(
              color: MColors.gray[600],
            ),
            textAlign: TextAlign.left,
          ),
          InkWell(
            onTap: widget.focusNode.hasFocus
                ? null
                : () => widget.focusNode.requestFocus(),
            focusColor: Colors.white,
            hoverColor: Colors.white,
            highlightColor: Colors.white,
            splashColor: Colors.black.withAlpha(25),
            child: AbsorbPointer(
              absorbing: !widget.focusNode.hasFocus,
              child: TextField(
                focusNode: widget.focusNode,
                style:
                    MTextStyles.bold[21]!.copyWith(color: MTextColors.primary),
                decoration: InputDecoration(
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
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _buildClearButton(),
                        _buildStatusIcon(),
                        _buildObscureButton(),
                        _buildBtnTextDefaultButton(
                            btn: widget.btnName, onTap: () {}),
                      ],
                    )),
                controller: widget.controller,
              ),
            ),
          ),
        ],
      );
    } else {
      // TODO: 수평형 텍스트필드 구현
      return SizedBox.shrink();
    }
  }

  _buildStatusIcon() {
    switch (widget.status) {
      case TextFieldStatus.normal:
        return SizedBox.shrink();
      case TextFieldStatus.success:
        return MStatusIcon(
          child: Image.asset('assets/images/ic_check_24dp.png'),
        );
      case TextFieldStatus.error:
        return MStatusIcon(
          child: Image.asset('assets/images//ic_error_24dp.png'),
        );
      default:
        return SizedBox.shrink();
    }
  }

  _buildClearButton() {
    if (_showClearButton!)
      return MTextFieldTrailingButton.image(
        onTap: () => widget.controller.clear(),
        child: Image.asset(
          'assets/images/ic_clear_24dp.png',
        ),
      );
    else
      return SizedBox.shrink();
  }

  _buildObscureButton() {
    if (widget.obscure != null)
      return MTextFieldTrailingButton.image(
        onTap: () {
          setState(() {
            _obscured = !_obscured!;
          });
        },
        child: Icon(
          _obscured!
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          size: 20,
          color: MColors.gray[200],
        ),
      );
    else
      return SizedBox.shrink();
  }

  _buildBtnTextDefaultButton(
      {String btn = '', required void Function() onTap}) {
    return MTextFieldTrailingButton.text(
      child: Text(
        btn,
        style: MTextStyles.bold[16]!.copyWith(
          color: MColors.blue[800],
        ),
      ),
      onTap: onTap,
    );
  }

  _notError() => widget.status != TextFieldStatus.error;
}
