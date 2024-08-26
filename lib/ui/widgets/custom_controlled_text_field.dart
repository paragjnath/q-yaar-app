import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controlled_text_field.dart';

class CustomControlledTextField extends StatelessWidget {
  final String label;
  final String text;
  final void Function(String text) onChanged;
  final GestureTapCallback? onTap;
  final bool readOnly;
  final bool isRequired;
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  const CustomControlledTextField({
    super.key,
    required this.text,
    required this.onChanged,
    this.onTap,
    this.readOnly = false,
    required this.label,
    this.isRequired = false,
    this.hintText,
    this.errorText,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF686767),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            if (isRequired)
              const Text(
                '*',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        ControlledTextField(
          onTap: onTap,
          readOnly: readOnly,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF0068FF), width: 1),
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFB3B3B3), width: 1),
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            hintText: hintText,
            errorText: errorText,
          ),
          text: text,
          onChanged: onChanged,
          keyboardType: keyboardType,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }
}
