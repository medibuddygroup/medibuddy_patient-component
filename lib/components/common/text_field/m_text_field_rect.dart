import 'package:flutter/material.dart';
import 'package:medibuddy_ui_kit/medibuddy_ui_kit.dart';

class MTextFieldRect extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final String placeholder;
  final TextFieldStatus status;
  final String? error;
  final String btnName;
  final bool? obscure;
  final bool enabled;
  final void Function()? onEditingCompleted;
  final void Function(String)? onChanged;
  final void Function()? onSubmitted;

  MTextFieldRect(
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
      this.btnName = ''})
      : super(key: key);

  @override
  _MTextFieldRectState createState() => _MTextFieldRectState();
}

class _MTextFieldRectState extends State<MTextFieldRect> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: MTextStyles.bold[14],
        ),
        AnimatedContainer(
          height: 48,
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
          decoration: BoxDecoration(
            border: Border.all(color: _borderColor!, width: 1),
            borderRadius: BorderRadius.circular(8),
            boxShadow: _boxShadow != null ? [_boxShadow!] : null,
            color: widget.enabled ? Colors.white : MColors.gray[60],
          ),
          child: AbsorbPointer(
            absorbing: !widget.enabled,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onHighlightChanged:
                    _enableInkWell! ? _onHighlightChanged : null,
                onTap: _enableInkWell!
                    ? () => widget.focusNode.requestFocus()
                    : null,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                child: Row(
                  children: [
                    Expanded(
                      child: AbsorbPointer(
                        absorbing: _enableInkWell!,
                        child: TextField(
                          onEditingComplete: widget.onEditingCompleted,
                          onChanged: widget.onChanged,
                          onSubmitted: widget.onChanged,
                          obscureText: _obscured!,
                          controller: widget.controller,
                          focusNode: widget.focusNode,
                          textInputAction: TextInputAction.next,
                          style: widget.enabled
                              ? MTextStyles.bold[21]
                              : MTextStyles.bold[21]!.copyWith(
                                  color: MColors.gray[200],
                                ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 9,
                              horizontal: 12,
                            ),
                            hintText: widget.placeholder,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildClearButton(),
                          _buildStatusIcon(),
                          _buildObscureButton(),
                          _buildBtnTextDefaultButton(
                              btn: widget.btnName, onTap: () {}),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        _buildErrorMessage(),
      ],
    );
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

  _buildErrorMessage() {
    return widget.error != null
        ? Text(
            widget.error!,
            style: MTextStyles.regular[12]!.copyWith(
              color: MColors.red[700],
            ),
          )
        : SizedBox.shrink();
  }

  _notError() => widget.status != TextFieldStatus.error;
}
