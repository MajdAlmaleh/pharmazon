import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.phoneNumberValidator,
    required this.onSave,
    required this.formatter,
    required this.hintText,
    required this.textInputType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String? Function(String? p1)? phoneNumberValidator;
  final void Function(String? p1)? onSave;
  final List<TextInputFormatter>? formatter;
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: phoneNumberValidator,
      onSaved: onSave,
      keyboardType: textInputType,
      inputFormatters: formatter,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon:suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 1),
          
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
