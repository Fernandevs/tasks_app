import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final int? maxLines;
  final String? label;
  final String? hint;
  final String? errorMessage;
  final String? initialValue;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final Icon? prefixIcon;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.maxLines,
    this.errorMessage,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: colors.primary),
    );

    return TextFormField(
      maxLines: maxLines,
      initialValue: initialValue,
      enabled: enabled,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red.shade800),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red.shade800),
        ),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        focusColor: colors.primary,
        prefixIcon: prefixIcon,
        /* icon: Icon(
          Icons.supervised_user_circle_outlined,
          color: colors.primary,
        ), */
      ),
    );
  }
}
