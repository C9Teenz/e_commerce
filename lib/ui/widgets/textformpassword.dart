// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFormPassword extends StatelessWidget {
  final TextEditingController control;
  final bool obscure;
  final VoidCallback onTap;
  final FormFieldValidator<String>? validator;
  const TextFormPassword({
    Key? key,
    required this.control,
    required this.obscure,
    required this.onTap,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: control,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(
                obscure ? Icons.visibility_off : Icons.remove_red_eye_rounded)),
        prefixIcon: const Icon(
          Icons.lock_outline,
          size: 28,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        labelText: 'Enter Your Password',
      ),
    );
  }
}