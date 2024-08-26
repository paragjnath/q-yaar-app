import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ControlledTextField extends StatefulWidget {
  final TextAlign? textAlign;
  final TextStyle? style;
  final String text;
  final InputDecoration? decoration;
  final void Function(String text) onChanged;
  final GestureTapCallback? onTap;
  final bool readOnly;
  final TextInputType? keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;

  const ControlledTextField({
    super.key,
    required this.text,
    required this.onChanged,
    this.decoration,
    this.onTap,
    this.readOnly = false,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
    this.style,
    this.textAlign,
    this.obscureText = false,
  });

  @override
  ControlledTextFieldState createState() => ControlledTextFieldState();
}

class ControlledTextFieldState extends State<ControlledTextField> {
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.value =
        _textEditingController.value.copyWith(text: widget.text);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ControlledTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget != widget) {
      if (_textEditingController.text != widget.text) {
        _textEditingController.value =
            _textEditingController.value.copyWith(text: widget.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText:widget.obscureText,
      textAlign: widget.textAlign ?? TextAlign.start,
      style: widget.style,
      controller: _textEditingController,
      onChanged: widget.onChanged,
      decoration: widget.decoration,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
    );
  }
}
