import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const TextInput({
    Key? key,
    required this.label,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: label,
        label: Text(label),
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
