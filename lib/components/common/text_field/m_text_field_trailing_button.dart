import 'package:flutter/material.dart';

class MTextFieldTrailingButton extends StatefulWidget {
  final Widget child;
  final void Function() onTap;
  final double width;
  final double height;

  MTextFieldTrailingButton.image(
      {Key? key, required this.child, required this.onTap})
      : this.width = 32,
        this.height = 46,
        super(key: key);

  MTextFieldTrailingButton.text(
      {Key? key, required this.child, required this.onTap})
      : this.width = 48,
        this.height = 46,
        super(key: key);

  @override
  _MTextFieldTrailingButtonState createState() =>
      _MTextFieldTrailingButtonState();
}

class _MTextFieldTrailingButtonState extends State<MTextFieldTrailingButton> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.attach(context);
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      canRequestFocus: false,
      descendantsAreFocusable: false,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          alignment: Alignment.center,
          width: widget.width,
          height: widget.height,
          child: Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
