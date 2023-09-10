// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
class TextFormGlobal extends StatelessWidget {
  final TextEditingController control;
  final TextInputType inputType;
  final IconData icon;
  final String label;
  final FormFieldValidator<String>? validator;
  const TextFormGlobal({
    Key? key,
    required this.control,
    required this.inputType,
    required this.icon,
    required this.label,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: control,
      validator:validator,
      keyboardType: inputType,
      decoration: InputDecoration(
        prefixIcon:  Icon(
          icon,
          size: 28,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        labelText: label,
      ),
    );
  }
}